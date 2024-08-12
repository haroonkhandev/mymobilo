ActiveAdmin.register Article do
  permit_params :title, :content, :article_category_id, :admin_user_id, images: []

  filter :has_images, as: :boolean, label: 'With Images', collection: [['Yes', true], ['No', false]]

  # Define custom scopes for image presence
  scope :all, default: true
  scope :with_images do |scope|
    scope.with_images
  end

  scope :without_images do |scope|
    scope.without_images
  end

  controller do
    def create
      if current_admin_user.email == "mymobilo.co@gmail.com"
        super
      else
        flash[:error] = "You are not authorized to create articles."
        redirect_to admin_articles_path
      end
    end
  end

  controller do
    def update
      @article = Article.find(params[:id])

      # If no new images are uploaded, remove the images parameter to keep the existing ones
      if params[:article][:images].all?(&:blank?)
        params[:article].delete(:images)
      end

      if @article.update(permitted_params[:article])
        redirect_to admin_article_path(@article), notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end
  end


  index do
    selectable_column
    id_column
    column :title
    column :article_category
    column :admin_user
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :quill_editor
      if object.images.attached?
        f.object.images.attachments.each do |image|
            span do
              image_tag url_for(image), style: 'max-width:190px; max-height: 190px;'
            end
          end
      else
          span "No images available"
      end
      f.input :images, as: :file, input_html: { multiple: true }, hint: 'Upload new images to replace the existing ones'
      f.input :article_category, as: :select, collection: ArticleCategory.all
      f.input :admin_user, as: :select, collection: AdminUser.all.collect { |admin| [admin.email, admin.id] }
      # f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :article_category
      row :content do |article|
        raw article.content # Ensure content is displayed correctly
      end
      row :admin_user
      row :created_at
      row :updated_at
      row :images do |article|
        if article.images.attached?
          article.images.each do |image|
            span do
              image_tag image, style: 'max-width: 200px; max-height: 200px;'
            end
          end
        else
          span "No images available"
        end
      end
    end
  end

end
