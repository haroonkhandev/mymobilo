class AddColumnsToFrequencies < ActiveRecord::Migration[7.0]
  def change
    create_table :frequencies do |t|
      t.string :second_generation
      t.string :third_generation
      t.string :fourth_generation
      t.string :fifth_generation
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
