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

    @categories = Category.all
    @active_category = params[:category_id] || 'all'

    @products_by_category = @categories.each_with_object({}) do |category, hash|
      hash[category.id] = @shop_products.where(category_id: category.id)
    end

    @all_products = @shop_products

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
    product = Product.friendly.find(params[:product_id])
    @shop = ShopkeeperShop.find(params[:shop_id])
    search_params = params[:search] || {}
    quantity = params[:quantity].to_i

    if @shop.products.include?(product)
      flash[:alert] = "Product is already in your shop."
    else
      shop_product = ShopProduct.new(product_id: product.id, shopkeeper_shop_id: @shop.id, quantity: quantity)
      if shop_product.save
        @shop.log_activity('Product Added', "Product '#{product.name}' (Quantity: #{quantity}) was added to your shop.")
        flash[:notice] = "#{product.name} added to your shop successfully."
      else
        flash[:alert] = "Failed to add product to your shop."
      end
    end

    respond_to do |format|
      format.html { redirect_to search_product_shopkeeper_shop_path(@shop, search: search_params) }
      format.js
    end
  end

  def remove_to_shop
    shop_product = ShopProduct.where(product_id: params[:product_id], shopkeeper_shop_id: params[:shop_id]).first
    @shop = ShopkeeperShop.find(params[:shop_id])
    product = Product.find(params[:product_id])
    search_params = params[:search] || {}

    if shop_product.destroy
      @shop.log_activity('Product Removed', "Product '#{product.name}'")
      flash[:notice] = "#{product.name} removed to your shop successfully."
    else
      flash[:alert] = "Failed to add product to your shop."
    end

    respond_to do |format|
      format.html { redirect_to search_product_shopkeeper_shop_path(@shop, search: search_params) }
      format.js
    end
  end

  def destroy
    @shopkeeper_shop.destroy
    redirect_to shopkeepers_dashboard_path, alert: 'Shop was successfully destroyed.'
  end

  def user_shops
    @shopkeeper_shop = ShopkeeperShop.find(params[:id])
    @shop_products = @shopkeeper_shop.products.page(params[:page]).per(8)

    @categories = Category.all
    @products_by_category = @categories.each_with_object({}) do |category, hash|
      products = @shop_products.where(category_id: category.id)
      hash[category.id] = products if products.any?
    end

    @all_products = @shop_products

    @active_category = params[:category] || 'all'

    # Fetch or initialize the rating for the current user
    @rating = Rating.find_or_initialize_by(user: current_user, shopkeeper_shop: @shopkeeper_shop)
  end

  def rate
    @shopkeeper_shop = ShopkeeperShop.find(params[:id])
    @rating = Rating.find_or_initialize_by(user: current_user, shopkeeper_shop: @shopkeeper_shop)
    @rating.rating = params[:rating].to_i

    if @rating.save
      # Calculate the new average rating for the shop
      average_rating = @shopkeeper_shop.ratings.average(:rating).to_f.round(2)

      # Respond with JSON for AJAX
      render json: { average_rating: average_rating, rating: @rating.rating }
    else
      render json: { error: 'Unable to save rating' }, status: :unprocessable_entity
    end
  end

  def where_to_buy
    @product = Product.friendly.find(params[:id])
    @shop_products = ShopProduct.where(product_id: @product.id).includes(:shopkeeper_shop)
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
