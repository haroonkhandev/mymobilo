class AddDetailsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :camera_prod, :string
    add_column :products, :processor_prod, :string
    add_column :products, :storage_prod, :string
    add_column :products, :battery_prod, :string
    add_column :products, :ram_prod, :string
    add_column :products, :display_prod, :string
  end
end
