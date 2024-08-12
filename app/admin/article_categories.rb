ActiveAdmin.register ArticleCategory do
  # Permit the new parameters
  permit_params :name, :description, :title, :image
  filter :with_image, as: :boolean

  controller do
    def update
      @article_category = ArticleCategory.find(params[:id])

      if @article_category.update(permitted_params[:article_category])
        redirect_to admin_article_category_path(@article_category), notice: 'Article Category was successfully updated.'
      else
        render :edit
      end
    end
  end
  
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
      if f.object.image.attached?
        div do
          image_tag url_for(f.object.image), style: 'max-width:190px; max-height: 190px;'
        end
      end

      f.input :image, as: :file, hint: 'Upload a new image for the category'
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :description
      row :image do |category|
        if category.image.attached?
          image_tag url_for(category.image), style: 'max-width: 200px; max-height: 200px;'
        else
          "No Image"
        end
      end
      row :created_at
      row :updated_at
    end
  end
end

