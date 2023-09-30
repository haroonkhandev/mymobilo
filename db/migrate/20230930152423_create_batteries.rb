class CreateBatteries < ActiveRecord::Migration[7.0]
  def change
    create_table :batteries do |t|
      t.string :capacity
      t.string :charger
      t.string :charging
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
