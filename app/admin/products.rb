ActiveAdmin.register Product do
  permit_params :name, :description, :series, :camera_prod, :processor_prod, :storage_prod, :battery_prod, :ram_prod, :display_prod, :release_date, :price, :category_id, specifications_attributes: [:id, :specification_type, :spec_attributes, :_destroy]

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :series
      f.input :camera_prod
      f.input :processor_prod
      f.input :storage_prod
      f.input :battery_prod
      f.input :ram_prod
      f.input :display_prod
      f.input :category, as: :select, collection: Category.all.collect { |category| [category.name, category.id] }
      f.input :release_date
    end

    f.inputs "Specifications" do
      f.has_many :specifications, allow_destroy: true, new_record: true do |spec|
        spec.input :specification_type
        spec.input :spec_attributes
        spec.input :_destroy, as: :boolean, required: false, label: 'Remove'
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :series
      row :camera_prod
      row :processor_prod
      row :storage_prod
      row :battery_prod
      row :ram_prod
      row :display_prod
      row :category
      row :release_date
    end

    panel "Specifications" do
      table_for product.specifications do
        column :specification_type
        column :spec_attributes
      end
    end
  end

end
