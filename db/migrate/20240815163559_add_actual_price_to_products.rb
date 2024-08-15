class AddActualPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :actual_price, :string
  end
end
