class MainController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def product; end

  def store
    @categories = Category.all
  end

  def checkout; end

  def sub_category; end
end
