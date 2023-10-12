class ProductsController < ApplicationController

  def index
    if params[:search]
      keyword = params[:search].downcase
      @products = Product.where("LOWER(name)LIKE ?", "%#{keyword}%")
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
