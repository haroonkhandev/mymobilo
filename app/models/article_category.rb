class ArticleCategory < ApplicationRecord
  has_many :articles, dependent: :destroy
  # has_one_attached :image

  validates :name, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["articles"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
