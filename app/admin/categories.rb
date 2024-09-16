ActiveAdmin.register Category do
  permit_params :name, :picture

  # Filters
  filter :name
  filter :created_at

  # Form for creating/editing categories
  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :picture, as: :file  # Add file upload input for picture
    end
    f.actions
  end

  # Show page to display the category details
  show do
    attributes_table do
      row :name
      row :picture do |category|
        if category.picture.present?
          image_tag category.picture.url, size: "200x200"  # Display the uploaded image
        else
          "No Image Uploaded"
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # Index page to display the list of categories
  index do
    selectable_column
    id_column
    column :name
    column :picture do |category|
      if category.picture.present?
        image_tag category.picture.url, size: "100x100"  # Show thumbnail in the index list
      else
        "No Image"
      end
    end
    column :created_at
    column :updated_at
    actions
  end
end