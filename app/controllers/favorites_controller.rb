class FavoritesController < ApplicationController
  before_action :authenticate_user! # Ensure user is signed in
  before_action :set_product, only: [:create, :destroy]

  def index
  @favorite_products = current_user.favorite_products.includes(:category)

  respond_to do |format|
    format.html # This will render the default index.html.erb view
    format.json { render json: @favorite_products, status: :ok }
  end
end

  def create
    if current_user.favorites.create(product: @product)
      respond_to do |format|
        format.json { render json: { productId: @product.id, status: 'favorited', unfavoriteUrl: unfavorite_product_path(@product), favoriteUrl: favorite_product_path(@product) }, status: :ok }
      end
    else
      render json: { error: 'Unable to favorite the product' }, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(product_id: @product.id)

    if favorite
      favorite.destroy
      respond_to do |format|
        format.json do
          render json: {
            productId: @product.id,
            status: 'unfavorited',
            favoriteUrl: favorite_product_path(@product),
            unfavoriteUrl: unfavorite_product_path(@product)
          }, status: :ok
        end
        format.html { redirect_to favorites_path, notice: "Removed from favorites." }
      end
    else
      respond_to do |format|
        format.json { render json: { error: 'Favorite not found' }, status: :unprocessable_entity }
        format.html { redirect_to favorites_path, alert: "Favorite not found." }
      end
    end
  end

  private

  def set_product
    @product = Product.find_by(slug: params[:id])
    render json: { error: 'Product not found' }, status: :not_found unless @product
  end
end