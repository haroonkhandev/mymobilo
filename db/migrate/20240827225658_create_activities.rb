class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :action
      t.text :details
      t.references :shopkeeper_shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end