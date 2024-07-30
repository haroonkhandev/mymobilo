class CreateSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :specifications do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :specification_type, null: false
      t.jsonb :spec_attributes, default: {}
      t.timestamps
    end

    add_index :specifications, :specification_type
  end
end
