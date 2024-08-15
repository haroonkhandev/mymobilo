class AddMainImageToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :main_image, :string
  end
end
