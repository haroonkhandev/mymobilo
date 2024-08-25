class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @shopkeeper_shops = ShopkeeperShop.all

    if params[:search].present?
      @shopkeeper_shops = @shopkeeper_shops.where('shop_name LIKE ?', "%#{params[:search]}%")
    end
  end
end
