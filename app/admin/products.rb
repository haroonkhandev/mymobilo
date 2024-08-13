ActiveAdmin.register Product do
  permit_params :name, :description, :series, :is_old, :camera_prod, :processor_prod, :storage_prod, :battery_prod, :ram_prod, :display_prod, :release_date, :price, :category_id, images: [], specifications_attributes: [:id, :specification_type, :spec_attributes, :_destroy]

  filter :has_images, as: :boolean, label: 'Gallary Images', collection: [['Yes', true], ['No', false]]

  # Define custom scopes for image presence
  scope :all, default: true
  scope :with_images do |scope|
    scope.with_images
  end

  scope :without_images do |scope|
    scope.without_images
  end

  controller do
    def find_resource
      Product.friendly.find(params[:id])
    end
  end

  controller do
    def update
      @product = Product.friendly.find(params[:id])

      # If no new images are uploaded, remove the images parameter to keep the existing ones
      if params[:product][:images].all?(&:blank?)
        params[:product].delete(:images)
      end

      if @product.update(permitted_params[:product])
        redirect_to admin_product_path(@product), notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :series
    column :is_old, label: 'Is this old'
    column :release_date
    actions
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description, as: :quill_editor
      f.input :price
      f.input :series
      f.input :is_old, label: 'Is this old'

      f.input :images, label: 'Gallary', as: :file, input_html: { multiple: true }, hint: 'Upload new images to replace the existing ones'
      if object.images.attached?
        f.object.images.attachments.each do |image|
            span do
              image_tag url_for(image), style: 'max-width:190px; max-height: 190px;'
            end
          end
      else
          span "No images available"
      end
      f.input :camera_prod
      f.input :processor_prod
      f.input :storage_prod
      f.input :battery_prod
      f.input :ram_prod
      f.input :display_prod
      f.input :category, as: :select, collection: Category.all.collect { |category| [category.name, category.id] }
      f.input :release_date
    end

    f.inputs "Specifications" do
      f.has_many :specifications, allow_destroy: true, new_record: true do |spec|
        spec.input :specification_type
        spec.input :spec_attributes
        spec.input :_destroy, as: :boolean, required: false, label: 'Remove'
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description do |product|
        raw product.description # Ensure content is displayed correctly
      end
      row :price
      row :series
      row :is_old, label: "Is this Old"
      
      row "Gallary" do |product|
        if product.images.attached?
          product.images.each do |image|
            span do
              image_tag image, style: 'max-width: 200px; max-height: 200px;'
            end
          end
        else
          span "No images available"
        end
      end
      row :camera_prod
      row :processor_prod
      row :storage_prod
      row :battery_prod
      row :ram_prod
      row :display_prod
      row :category
      row :release_date
    end

    panel "Specifications" do
      table_for product.specifications do
        column :specification_type
        column :spec_attributes
      end
    end
  end

end
