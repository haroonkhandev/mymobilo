class Article < ApplicationRecord
  belongs_to :article_category
  belongs_to :admin_user, class_name: 'AdminUser'

  # has_many_attached :images

  validates :title, :content, :article_category_id, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["admin_user", "article_category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "article_category_id", "content", "created_at", "id", "title", "updated_at"]
  end
end
