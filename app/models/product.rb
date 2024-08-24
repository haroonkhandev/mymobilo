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
  has_many :users, through: :shop_products

	scope :last_30_days, -> { where(release_date: (Time.now - 30.days)..Time.now) }
	scope :upcoming_products, -> { where('release_date > ?', Date.today) }
	scope :latest, lambda{ where(['release_date > ?', 30.days.ago]) }
	scope :order_by_products, -> { order(release_date: :desc) }

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
