class AddIsOldToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_old, :boolean, default: false
  end
end
