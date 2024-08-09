class Product < ApplicationRecord
	# concerns
	include ProductSpecificationsConcern

	paginates_per 6
	mount_uploaders :images, ImageUploader
	serialize :images, Array
	has_many :comments, dependent: :destroy
	has_many :specifications, dependent: :destroy
	accepts_nested_attributes_for :specifications, allow_destroy: true
	belongs_to :category

	scope :last_30_days, -> { where(release_date: (Time.now - 30.days)..Time.now) }
	scope :upcoming_products, -> { where('release_date > ?', Date.today) }
	scope :latest, lambda{ where(['release_date > ?', 30.days.ago]) }

	def is_upcoming?
    release_date > Date.today
  end

  def is_latest?
	release_date > Date.today - 30.days
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "images", "name", "price", "release_date", "series", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "comments", "specifications"]
  end


end
