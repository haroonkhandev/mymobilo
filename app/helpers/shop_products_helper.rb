module ShopProductsHelper
	def shop_product_quantity(shopkeeper_shop, product)
	    shop_product = shopkeeper_shop.shop_products.find_by(product_id: product.id)
	    shop_product.present? ? shop_product.quantity : 0
	end
end
