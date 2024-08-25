class CreateShopProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :shopkeeper_shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
