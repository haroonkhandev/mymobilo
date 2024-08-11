class ArticleCategory < ApplicationRecord
  has_many :articles, dependent: :destroy
  # has_one_attached :image

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
end
