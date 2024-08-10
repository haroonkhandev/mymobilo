ActiveAdmin.register ArticleCategory do
    permit_params :name, :image
  
    index do
      selectable_column
      id_column
      column :name
      column :created_at
      actions
    end
  
    form do |f|
      f.inputs do
        f.input :name
        # f.input :image, as: :file
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :name
        row :created_at
        row :updated_at
        # row :image do |category|
        #   image_tag url_for(category.image), size: "100x100" if category.image.attached?
        # end
      end
    end
  end