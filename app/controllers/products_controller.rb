class ProductsController < ApplicationController

  def index
    if params[:search]
      keyword = params[:search].downcase
      @products = Product.where("LOWER(name)LIKE ?", "%#{keyword}%")
    elsif params[:name].present?
      keyword = params[:name].downcase
      @category = Category.where("LOWER(name)LIKE ?", "%#{keyword}%")
      @products = Product.where(category_id: @category.ids)
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
