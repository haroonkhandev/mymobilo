class ShopkeeperProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_shopkeeper!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shopkeeper_profile, only: [:show, :edit, :update, :destroy]
  before_action :ensure_profile_ownership, only: [:edit, :update, :destroy, :show]

  def index
    if current_user.shopkeeper?
      @shopkeeper_profiles = current_user.shopkeeper_profiles
    else
      redirect_to users_dashboard_path, alert: 'Access Denied'
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

  def search_product
    @products = if params[:search].present?
                  Product.where('name ILIKE ?', "%#{params[:search]}%")
                else
                  redirect_to shopkeeper_profile_path(@shopkeeper_profile)
                end
    @added_product_ids = ShopProduct.where(shop_id: params[:id]).pluck(:product_id)
  end

  def add_to_shop
    product = Product.find(params[:product_id])
    shopkeeper = current_user
    shop = ShopkeeperProfile.find(params[:shop_id])
    search_params = params[:search] || {}

    # Add the product to the shopkeeper's shop
    if shopkeeper.products.include?(product)
      flash[:alert] = "Product is already in your shop."
    else
      ShopProduct.create(user_id: shopkeeper.id, product_id: product.id, shop_id: shop.id)
      flash[:notice] = "Product added to your shop successfully."
    end

    respond_to do |format|
        format.html { redirect_to search_product_shopkeeper_profile_path(shop, search: search_params) }
        format.js
      end
  end

  def destroy
    @shopkeeper_profile.destroy
    redirect_to shopkeepers_dashboard_path, notice: 'Profile was successfully destroyed.'
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
