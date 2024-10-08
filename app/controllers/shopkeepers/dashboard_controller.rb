class Shopkeepers::DashboardController < ApplicationController
  before_action :authenticate_shopkeeper!

  def index
    if current_user.shopkeeper?
      # Fetch only the current user's shop profiles
      @shopkeeper_shops = current_user.shopkeeper_shops
    else
      # Fetch all shop profiles for users
      @shopkeeper_shops = ShopkeeperShop.all
    end

    # Optionally filter based on search if a search term is provided
    if params[:search].present?
      @shopkeeper_shops = @shopkeeper_shops.where('shop_name ILIKE ?', "%#{params[:search]}%")
    end
  end

  def authenticate_shopkeeper!
    unless current_user&.shopkeeper?
      redirect_to root_path, alert: "Access denied."
    end
  end
end
