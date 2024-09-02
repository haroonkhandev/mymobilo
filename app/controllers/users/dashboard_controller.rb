class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.joins(:shop_products).distinct.page(params[:page]).per(8)
    @samsung_products = @products.where(category_id: 1)
    @oppo_products = @products.where(category_id: 2)
    @vivo_products = @products.where(category_id: 3)
    @infinix_products = @products.where(category_id: 4)
    @techno_products = @products.where(category_id: 5)
    @huawei_products = @products.where(category_id: 6)
    @iphone_products = @products.where(category_id: 7)
    @total_product_count = Product.joins(:shop_products).distinct.count
    @shopkeeper_shops = ShopkeeperShop.all

    if params[:search].present?
      @shopkeeper_shops = @shopkeeper_shops.where('shop_name LIKE ?', "%#{params[:search]}%")
    end
  end

  def authenticate_user!
    unless current_user&.user?
      redirect_to root_path, alert: "Access denied."
    end
  end
end
