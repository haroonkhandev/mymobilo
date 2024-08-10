ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation


  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
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

end
