class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    if params[:name] == "all"
      @products = Product.all 
    elsif params[:category_id]
      @products = Product.where(category_id: params[:category_id])
    else
    end
  end

  def show ;end
end
