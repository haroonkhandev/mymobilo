class Product < ApplicationRecord
	# concerns
	include ProductSpecificationsConcern
	extend FriendlyId
  friendly_id :name, use: :slugged
	before_save :keep_images, if: :will_save_change_to_images?
	has_many_attached :images
  has_one_attached :main_image
  paginates_per 6
	serialize :images, Array
	has_many :comments, dependent: :destroy
	has_many :specifications, dependent: :destroy
	accepts_nested_attributes_for :specifications, allow_destroy: true
	belongs_to :category
  has_many :shop_products
  has_many :shopkeeper_shops, through: :shop_products

  enum product_type: { flagship: 0, mid_range: 1 }

  scope :flagships, -> { where(product_type: :flagship) }
  scope :mid_ranges, -> { where(product_type: :mid_range) }

	scope :last_30_days, -> { where(release_date: (Time.now - 30.days)..Time.now) }
	scope :upcoming_products, -> { where('release_date > ?', Date.today) }
	scope :latest, lambda{ where(['release_date > ?', 30.days.ago]) }
	scope :order_by_products, -> { order(release_date: :desc) }

  # scopes for related product feature

  scope :similar_type, ->(product) { where(product_type: product.product_type) }
  scope :similar_price, ->(product) {
  numeric_price = product.price.gsub(/[^\d]/, '').to_i
  where(price: (numeric_price - 10000)..(numeric_price + 10000))
}
  # scope :similar_processor, ->(product) { where("LOWER(processor_prod) LIKE ?", "%#{product.processor_prod.downcase}%") }
  # scope :similar_camera, ->(product) { where("LOWER(camera_prod) LIKE ?", "%#{product.camera_prod.downcase}%") }

  def related_products
    Product.similar_type(self)
           .similar_price(self)
           .where.not(id: self.id) # Exclude the current product
           .limit(4) # Adjust the limit as needed
  end

	def is_upcoming?
    release_date > Date.today
  end

  def self.order_by_products
    order(release_date: :desc)
  end

  def is_latest?
	release_date > Date.today - 30.days
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "main_iamge", "images", "camera_prod", "processor_prod", "storage_prod", "battery_prod", "ram_prod", "display_prod", "name", "price", "release_date", "series", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "comments", "specifications"]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ['has_images', 'has_image']  # Add other attributes as needed
  end

  def self.ransackable_associations(auth_object = nil)
    super + %w[main_image_attachment main_image_blob]
  end
  scope :with_main_image, -> { joins(:main_image_attachment) }

  def self.ransackable_scopes(auth_object = nil)
    [:with_main_image]
  end

  def has_image?
    main_image.attached?
  end

  scope :with_images, -> {
    joins(:images_attachments)
    .group('products.id')
    .having('COUNT(active_storage_attachments.id) > 0')
  }

  # Scope to find articles without images
  scope :without_images, -> {
    left_joins(:images_attachments)
    .group('products.id')
    .having('COUNT(active_storage_attachments.id) = 0')
  }

  # Method to check if an article has images
  def self.has_images?
    joins(:images_attachments)
    .group('products.id')
    .having('COUNT(active_storage_attachments.id) > 0')
  end

  private

  def validate_image_dimensions
    return unless main_image.attached?

    image = MiniMagick::Image.read(main_image.download)
    if image.width != 800 || image.height != 600
      errors.add(:main_image, 'Width must be 800px and height must be 600px')
    end
  end

  def keep_images
    images.attach(images_blobs) if images_blobs.present?
  end
end
