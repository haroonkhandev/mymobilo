class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    if params[:name] == "all"
      @products = Product.all 
    elsif params[:category_id]
      @products = Product.where(category_id: params[:category_id])
    else
      keyword = params[:name].downcase
      @category = Category.where("LOWER(name)LIKE ?", "%#{keyword}%")
      @products = Product.where(category_id: @category.id)
    end
  end
  def show ;end
end
