ActiveAdmin.register ShopkeeperShop do
  permit_params :shop_name, :description, :address, :contact_info, :operating_hours, :location, :shop_images

  index do
    selectable_column
    id_column
    column :shop_name
    column :user
    column :created_at
    actions
  end
end