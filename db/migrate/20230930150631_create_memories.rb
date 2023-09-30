class CreateMemories < ActiveRecord::Migration[7.0]
  def change
    create_table :memories do |t|
      t.string :ram
      t.string :ram_type
      t.string :storage
      t.string :storage_type
      t.string :card
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
