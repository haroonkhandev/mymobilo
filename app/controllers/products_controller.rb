class ProductsController < ApplicationController
  def index
    if params[:search]
      keyword = params[:keyword].downcase
      @products = Product.where("LOWER(name)LIKE ?", "%#{keyword}%")
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
