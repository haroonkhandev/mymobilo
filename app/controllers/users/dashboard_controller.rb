class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch only products that are associated with shops
    @products = Product.joins(:shop_products).distinct.page(params[:page]).per(8)
    @total_product_count = Product.joins(:shop_products).distinct.count

    # Fetch only categories that have associated products
    @categories = Category.joins(products: :shop_products).distinct

    # Handle search if present
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
