class CreateConnectivities < ActiveRecord::Migration[7.0]
  def change
    create_table :connectivities do |t|
      t.string :wlan
      t.string :bluetooth
      t.string :gps
      t.string :radio
      t.string :usb
      t.string :nfc
      t.string :infrared
      t.string :data
      t.references :product, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
