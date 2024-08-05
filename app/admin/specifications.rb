ActiveAdmin.register Specification do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :product_id, :specification_type, :spec_attributes
  #
  # or
  #
  permit_params do
    permitted = [:product_id, :specification_type, :spec_attributes]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  
end
