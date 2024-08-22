class CreateShopkeeperProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :shopkeeper_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :shop_name
      t.text :description
      t.string :address
      t.string :location
      t.string :shop_images
      t.string :contact_info
      t.string :operating_hours

      t.timestamps
    end
  end
end
