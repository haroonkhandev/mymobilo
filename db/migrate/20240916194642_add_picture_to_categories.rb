class AddPictureToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :picture, :string
  end
end
