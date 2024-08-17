class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
  end
end
