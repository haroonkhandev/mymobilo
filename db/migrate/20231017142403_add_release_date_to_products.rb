class AddReleaseDateToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :release_date, :date
  end
end
