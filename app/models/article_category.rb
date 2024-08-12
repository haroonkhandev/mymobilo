class ArticleCategory < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_one_attached :image

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["articles"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at", "title", "description"]
  end

  scope :with_image, -> { where.not(image: nil) }

  def self.ransackable_scopes(auth_object = nil)
    %i[with_image]
  end

  # Scope to find articles without images
  scope :without_image, -> {
    left_joins(:images_attachments)
    .group('articles.id')
    .having('COUNT(active_storage_attachments.id) = 0')
  }

  # Method to check if an article has images
  def self.has_image?
    joins(:images_attachments)
    .group('articles.id')
    .having('COUNT(active_storage_attachments.id) > 0')
  end

end
