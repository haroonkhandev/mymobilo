ActiveAdmin.register Product do
  permit_params :name, :description, :price, :category_id, specifications_attributes: [:id, :specification_type, :spec_attributes, :_destroy]

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :category, as: :select, collection: Category.all.collect { |category| [category.name, category.id] }
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
      row :category
    end

    panel "Specifications" do
      table_for product.specifications do
        column :specification_type
        column :spec_attributes
      end
    end
  end

end
