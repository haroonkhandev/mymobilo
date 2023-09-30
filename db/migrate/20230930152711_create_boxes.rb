class CreateBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :boxes do |t|
      t.string :phone
      t.string :handsfree
      t.string :connector
      t.string :usb_cable
      t.string :charger
      t.string :sim_ejector
      t.string :guide
      t.string :protective_case
      t.string :warranty_card
      t.string :safety_guide
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
