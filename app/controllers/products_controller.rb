class ProductsController < ApplicationController

  def index
    @categories = Category.all
    if params[:search]
      keyword = params[:search].downcase
      @products = Product.where("LOWER(name)LIKE ?", "%#{keyword}%").page(params[:page])
      if @products.present?
        @category_name = Category.find(@products.first.category_id).name.capitalize
      end

      if params[:category].present?
        @products = @products.last_30_days.order(release_date: :desc) if params[:category] == "Newest"
        @products = @products.order(price: :asc) if params[:category] == "Lowest Price"
        @products = @products.order(price: :desc) if params[:category] == "Highest Price"
        respond_to do |format|
          format.html
          format.js
        end
      end
    elsif params[:name].present?
      keyword = params[:name].downcase
      @category = Category.where("LOWER(name)LIKE ?", "%#{keyword}%")
      @category_name = @category&.first&.name&.capitalize
      @products = Product.where(category_id: @category.ids).page(params[:page])
      if params[:category].present?
        @products = @products.last_30_days.order(release_date: :desc) if params[:category] == "Newest"
        @products = @products.order(price: :asc) if params[:category] == "Lowest Price"
        @products = @products.order(price: :desc) if params[:category] == "Highest Price"
        respond_to do |format|
          format.html
          format.js
        end
      end
    else
      @products = Product.all.page(params[:page])
      @products = @products.last_30_days.order(release_date: :desc) if params[:category] == "Newest"
      @products = @products.order(price: :asc) if params[:category] == "Lowest Price"
      @products = @products.order(price: :desc) if params[:category] == "Highest Price"
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @comments = @product.comments.order(created_at: :desc).page(params[:page])
  end
end
