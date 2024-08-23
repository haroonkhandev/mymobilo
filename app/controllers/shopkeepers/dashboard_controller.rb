class Shopkeepers::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.shopkeeper?
      # Fetch only the current user's shop profiles
      @shopkeeper_profiles = current_user.shopkeeper_profiles
    else
      # Fetch all shop profiles for users
      @shopkeeper_profiles = ShopkeeperProfile.all
    end

    # Optionally filter based on search if a search term is provided
    if params[:search].present?
      @shopkeeper_profiles = @shopkeeper_profiles.where('shop_name LIKE ?', "%#{params[:search]}%")
    end
  end
end
