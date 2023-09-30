class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :sensors
      t.string :audio
      t.string :speaker
      t.string :browser
      t.string :messaging
      t.string :games
      t.string :torch
      t.string :extra
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
