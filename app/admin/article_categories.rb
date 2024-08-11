ActiveAdmin.register ArticleCategory do
  # Permit the new parameters
  permit_params :name, :description, :title
  
  index do
    selectable_column
    id_column
    column :name
    column :title
    column :description
    column :created_at
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :title
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :description
      row :created_at
      row :updated_at
    end
  end
end

