class ShopkeeperShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_shopkeeper!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shopkeeper_shop, only: [:show, :edit, :update, :destroy]
  before_action :ensure_profile_ownership, only: [:edit, :update, :destroy, :show]

  def index
    if current_user.shopkeeper?
      @shopkeeper_shops = current_user.shopkeeper_shops
    else
      redirect_to users_dashboard_path, alert: 'Access Denied'
    end
  end

  def show
    @product_count = @shopkeeper_shop.product_count
    @shop_products = @shopkeeper_shop.products.page(params[:page]).per(8)
    @recent_activities = @shopkeeper_shop.activities.order(created_at: :desc).page(params[:activity_page]).per(5)
  end

  def new
    @shopkeeper_shop = current_user.shopkeeper_shops.new
  end

  def create
    @shopkeeper_shop = current_user.shopkeeper_shops.new(shopkeeper_shop_params)
    if @shopkeeper_shop.save
      @shopkeeper_shop.log_activity('Shop Created', 'Your shop was successfully created.')
      redirect_to @shopkeeper_shop, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shopkeeper_shop.update(shopkeeper_shop_params)
       @shopkeeper_shop.log_activity('Shop Updated', 'Your shop details were successfully updated.')
      redirect_to @shopkeeper_shop, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def search_product
    @products = if params[:search].present?
                  Product.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(5)
                else
                  redirect_to shopkeeper_profile_path(@shopkeeper_shop)
                end
    @added_product_ids = ShopProduct.where(shopkeeper_shop_id: params[:id]).pluck(:product_id)
  end

  def add_to_shop
    product =  Product.friendly.find(params[:product_id])
    @shop = ShopkeeperShop.find(params[:shop_id])
    search_params = params[:search] || {}

    # Add the product to the shopkeeper's shop
    if @shop.products.include?(product)
      flash[:alert] = "Product is already in your shop."
    else
      ShopProduct.create(product_id: product.id, shopkeeper_shop_id: @shop.id)
       @shop.log_activity('Product Added', "Product '#{product.name}' was added to your shop.")
      flash[:notice] = "Product added to your shop successfully."
    end

    respond_to do |format|
        format.html { redirect_to search_product_shopkeeper_shop_path(@shop, search: search_params) }
        format.js
      end
  end

  def destroy
    @shopkeeper_shop.destroy
    redirect_to shopkeepers_dashboard_path, notice: 'Shop was successfully destroyed.'
  end

  def user_shops
    @shopkeeper_shop = ShopkeeperShop.find(params[:id])
    @shop_products = @shopkeeper_shop.products.page(params[:page]).per(8)
  end

  private

  def set_shopkeeper_shop
    @shopkeeper_shop = ShopkeeperShop.find(params[:id])
  end

  def shopkeeper_shop_params
    params.require(:shopkeeper_shop).permit(:shop_name, :description, :address, :contact_info, :operating_hours, :location, :shop_images)
  end

  def authorize_shopkeeper!
    redirect_to root_path, alert: 'Access Denied' unless current_user.shopkeeper?
  end

  def ensure_profile_ownership
    redirect_to root_path, alert: 'Access Denied' unless @shopkeeper_shop.user == current_user || !current_user.shopkeeper?
  end
end
