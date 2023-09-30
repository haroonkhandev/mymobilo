class CreateCameras < ActiveRecord::Migration[7.0]
  def change
    create_table :cameras do |t|
      t.string :main
      t.string :front
      t.string :features
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
