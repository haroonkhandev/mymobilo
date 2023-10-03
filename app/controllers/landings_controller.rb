class LandingsController < ApplicationController
  def index
    @products = Product.all
    @sub_category = SubCategory.all
  end
end
