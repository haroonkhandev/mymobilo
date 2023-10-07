class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    if params[:name] == "all"
      @products = Product.all 
    elsif params[:category_id] && params[:sub_category_id]
      @sub_categories = SubCategory.where(category_id: params[:category_id])
      @sub_category = SubCategory.find (params[:sub_category_id])
      @products = @sub_category.products

    else
      @sub_categories = SubCategory.where(category_id: params[:category_id])
      @products = []
      @sub_categories.each do |sub_category|
        @products << Product.where(sub_category_id: sub_category.id)
      end
    end
  end

  def show ;end
end
