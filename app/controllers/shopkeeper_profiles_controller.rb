class ShopkeeperProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_shopkeeper!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shopkeeper_profile, only: [:show, :edit, :update, :destroy]
  before_action :ensure_profile_ownership, only: [:edit, :update, :destroy, :show]

  def index
    if current_user.shopkeeper?
      @shopkeeper_profiles = current_user.shopkeeper_profiles
    else
      @shopkeeper_profiles = ShopkeeperProfile.all
    end
  end

  def show
  end

  def new
    @shopkeeper_profile = current_user.shopkeeper_profiles.new
  end

  def create
    @shopkeeper_profile = current_user.shopkeeper_profiles.new(shopkeeper_profile_params)
    if @shopkeeper_profile.save
      redirect_to @shopkeeper_profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shopkeeper_profile.update(shopkeeper_profile_params)
      redirect_to @shopkeeper_profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shopkeeper_profile.destroy
    redirect_to shopkeeper_profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private

  def set_shopkeeper_profile
    @shopkeeper_profile = ShopkeeperProfile.find(params[:id])
  end

  def shopkeeper_profile_params
    params.require(:shopkeeper_profile).permit(:shop_name, :description, :address, :contact_info, :operating_hours, :location, :shop_images)
  end

  def authorize_shopkeeper!
    redirect_to root_path, alert: 'Access Denied' unless current_user.shopkeeper?
  end

  def ensure_profile_ownership
    redirect_to root_path, alert: 'Access Denied' unless @shopkeeper_profile.user == current_user || !current_user.shopkeeper?
  end
end
