class ShopProduct < ApplicationRecord
	belongs_to :user
	belongs_to :product

	validates :user_id, uniqueness: { scope: :product_id, message: "This product is already in your shop." }
end
