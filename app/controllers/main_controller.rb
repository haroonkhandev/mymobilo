class MainController < ApplicationController
  def index; end

  def product; end

  def store
    @categories = Category.all
  end

  def checkout; end

  def sub_category; end
end
