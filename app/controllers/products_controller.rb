class ProductsController < ApplicationController

  def index
    @categories = Category.all

    if params[:search].present?
      keyword = params[:search].downcase
      @products = Product.where("LOWER(name) LIKE ?", "%#{keyword}%").order(release_date: :desc).page(params[:page]).per(8)

      if @products.any?
        @category_name = Category.find(@products.first.category_id).name.capitalize
        @total_category_products_count = Product.where(category_id: @products.first.category_id).count
      end

      @result_type = "search"

      if params[:category].present?
        @products = @products.last_30_days.order(release_date: :desc) if params[:category] == "Newest"
        @products = @products.sort_by { |product| product.price.to_i } if params[:category] == "Lowest Price"
        @products = @products.sort_by { |product| -product.price.to_i } if params[:category] == "Highest Price"
      end
    elsif params[:name].present?
      keyword = params[:name].downcase
      @category = Category.where("LOWER(name) LIKE ?", "%#{keyword}%").first
      @category_name = @category&.name&.capitalize
      @total_category_products_count = @category&.products&.count || 0
      @products = Product.where(category_id: @category&.id).order(created_at: :desc).page(params[:page]).per(8)

      if params[:category].present?
        @products = @products.last_30_days.order(release_date: :desc) if params[:category] == "Newest"
        @products = @products.sort_by { |product| product.price.to_i } if params[:category] == "Lowest Price"
        @products = @products.sort_by { |product| -product.price.to_i } if params[:category] == "Highest Price"
      end
    else
      @products = Product.all.order(release_date: :desc).page(params[:page]).per(8)
      @products = @products.last_30_days.order(release_date: :desc) if params[:category] == "Newest"
      @products = @products.sort_by { |product| product.price.to_i } if params[:category] == "Lowest Price"
      @products = @products.sort_by { |product| -product.price.to_i } if params[:category] == "Highest Price"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @comments = @product.comments.order(created_at: :desc).page(params[:page])
    @related_products = @product.related_products
  end

  def all_products
    # Fetch products that are associated with at least one shopkeeper's shop
    @products = Product.joins(:shop_products).distinct.page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
