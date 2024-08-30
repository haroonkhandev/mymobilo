class AddQuantityToShopProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_products, :quantity, :integer
  end
end
