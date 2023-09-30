class CreateDisplays < ActiveRecord::Migration[7.0]
  def change
    create_table :displays do |t|
      t.string :technology
      t.string :size
      t.string :resolution
      t.string :extra_features
      t.string :refresh_rate
      t.string :brightness
      t.string :glass
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
