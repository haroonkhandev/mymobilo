class AddColumnsToProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :processors do |t|
      t.string :cpu
      t.string :chipset
      t.string :gpu
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
