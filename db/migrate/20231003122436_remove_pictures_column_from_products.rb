class RemovePicturesColumnFromProducts < ActiveRecord::Migration[7.0]
  def up
    remove_column :products, :pictures
  end

  def down
    add_column :products, :pictures, :string
  end
end
