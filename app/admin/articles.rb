ActiveAdmin.register Article do
    permit_params :title, :content, :article_category_id, :admin_user_id
  
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
        f.input :content, as: :text
        f.input :article_category, as: :select, collection: ArticleCategory.all
        f.input :admin_user, as: :select, collection: AdminUser.all
        # f.input :images, as: :file, input_html: { multiple: true }
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
        row :content
        row :article_category
        row :admin_user
        row :created_at
        row :updated_at
        # row :images do |article|
        #   ul do
        #     article.images.each do |image|
        #       li do
        #         image_tag url_for(image), size: "100x100"
        #       end
        #     end
        #   end
        # end
      end
    end
  end