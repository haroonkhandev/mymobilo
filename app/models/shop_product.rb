class ShopProduct < ApplicationRecord
	belongs_to :product
	belongs_to :shopkeeper_shop

end
