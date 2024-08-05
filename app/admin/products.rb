ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :series, :description, :price, :category_id, :release_date, :images
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :series, :description, :price, :category_id, :release_date, :images]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params do
    permitted = [:name, :description, :price, specifications_attributes: [:id, :specification_type, :spec_attributes, :_destroy]]
    permitted
  end

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
    end

    f.inputs 'Specifications' do
      f.has_many :specifications, allow_destroy: true, new_record: true do |s|
        s.input :specification_type, as: :select, collection: Specification.specification_types.keys.map { |type| [type.humanize, type] }
        s.input :spec_attributes, as: :text
        s.input :_destroy, as: :boolean, required: false, label: 'Remove'
      end
    end

    f.actions
  end
  
end
