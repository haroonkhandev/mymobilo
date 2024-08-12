class Article < ApplicationRecord
  before_save :keep_images, if: :will_save_change_to_images?
  has_many_attached :images
  belongs_to :article_category
  belongs_to :admin_user, class_name: 'AdminUser'

  validates :title, :content, :article_category_id, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["admin_user", "article_category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "article_category_id", "content", "created_at", "id", "title", "updated_at"]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ['has_images']  # Add other attributes as needed
  end

  scope :with_images, -> {
    joins(:images_attachments)
    .group('articles.id')
    .having('COUNT(active_storage_attachments.id) > 0')
  }

  # Scope to find articles without images
  scope :without_images, -> {
    left_joins(:images_attachments)
    .group('articles.id')
    .having('COUNT(active_storage_attachments.id) = 0')
  }

  # Method to check if an article has images
  def self.has_images?
    joins(:images_attachments)
    .group('articles.id')
    .having('COUNT(active_storage_attachments.id) > 0')
  end

  private

end
