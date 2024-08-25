class ShopkeeperShop < ApplicationRecord
  belongs_to :user
  has_many :shop_products
  has_many :products, through: :shop_products

  validates :shop_name, :description, :address, :contact_info, presence: true
end
