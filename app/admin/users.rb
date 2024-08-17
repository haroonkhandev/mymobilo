ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :email, :first_name, :last_name, :phone, :birthday, :address_line_1, :address_line_2, :state, :country, :password, :password_confirmation

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :birthday, as: :datepicker
      f.input :address_line_1
      f.input :address_line_2
      f.input :state
      f.input :country
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :phone
    column :birthday
    column :address_line_1
    column :address_line_2
    column :state
    column :country
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :phone
      row :birthday
      row :address_line_1
      row :address_line_2
      row :state
      row :country
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  
end
