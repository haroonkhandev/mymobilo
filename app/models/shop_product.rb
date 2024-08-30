class ShopProduct < ApplicationRecord
	belongs_to :product
	belongs_to :shopkeeper_shop

	validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
