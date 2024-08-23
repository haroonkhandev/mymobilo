class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @shopkeeper_profiles = ShopkeeperProfile.all

    if params[:search].present?
      @shopkeeper_profiles = @shopkeeper_profiles.where('shop_name LIKE ?', "%#{params[:search]}%")
    end
  end
end
