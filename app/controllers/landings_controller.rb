class LandingsController < ApplicationController
  def index
    @products = Product.all
  end
end
