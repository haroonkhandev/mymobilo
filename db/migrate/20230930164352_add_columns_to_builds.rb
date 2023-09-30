class AddColumnsToBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.string :os
      t.string :safety
      t.string :ui
      t.string :dimensions
      t.string :weight
      t.string :size
      t.string :finish
      t.string :sim
      t.string :colors
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
