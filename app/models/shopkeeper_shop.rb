class ShopkeeperShop < ApplicationRecord
  belongs_to :user
  has_many :shop_products
  has_many :products, through: :shop_products
  has_many :activities, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :shop_name, :description, :address, :contact_info, presence: true

  def product_count
    products.count
  end

  def log_activity(action, details)
    activities.create(action: action, details: details, created_at: Time.current)
  end

  def average_rating
    ratings.average(:rating).to_f
  end
end
