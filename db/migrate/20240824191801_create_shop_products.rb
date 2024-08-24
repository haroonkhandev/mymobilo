class CreateShopProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :shopkeeper_profile, :shop_id
      t.timestamps
    end
  end
end
