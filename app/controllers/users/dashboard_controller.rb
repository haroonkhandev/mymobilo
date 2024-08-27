class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.joins(:shop_products).distinct.page(params[:page]).per(8)
    @total_product_count = Product.joins(:shop_products).distinct.count
    @shopkeeper_shops = ShopkeeperShop.all

    if params[:search].present?
      @shopkeeper_shops = @shopkeeper_shops.where('shop_name LIKE ?', "%#{params[:search]}%")
    end
  end
end
