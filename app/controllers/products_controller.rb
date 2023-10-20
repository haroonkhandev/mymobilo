class ProductsController < ApplicationController

  def index
    @categories = Category.all
    if params[:search]
      keyword = params[:search].downcase
      @products = Product.where("LOWER(name)LIKE ?", "%#{keyword}%")
      respond_to do |format|
        format.html
        format.js { render js: @products }
      end
    elsif params[:name].present?
      keyword = params[:name].downcase
      @category = Category.where("LOWER(name)LIKE ?", "%#{keyword}%")
      @products = Product.where(category_id: @category.ids)
      if params[:category].present?
        @products = @products.order(created_at: :desc) if params[:category] == "Newest"
        @products = @products.order(price: :asc) if params[:category] == "Lowest Price"
        @products = @products.order(price: :desc) if params[:category] == "Highest Price"
        respond_to do |format|
          format.html
          format.js
        end
      end
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.order(created_at: :desc)
  end
end
