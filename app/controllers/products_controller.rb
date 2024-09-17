class ProductsController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.all

    # Apply category or search filters if present
    filter_by_category_name if params[:name].present?
    filter_by_search if params[:search].present?
    filter_by_product_type if params[:product_type].present?

    # Sort products if a sort parameter is present
    sort_products if params[:category].present?

    # Paginate the results
    @products = @products.order(release_date: :desc).page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @comments = @product.comments.order(created_at: :desc).page(params[:page])
    @related_products = @product.related_products
    @category = @product.category
  end

  def all_products
    @products = Product.joins(:shop_products).distinct.page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def filter_by_product_type
    product_types = params[:product_type]

    if @category
      # Filter products within the specific category
      @products = @products.where(category_id: @category.id, product_type: product_types)
    else
      # Filter all products
      @products = @products.where(product_type: product_types)
    end
  end

  def filter_by_search
    keyword = params[:search].downcase
    @products = @products.where("LOWER(name) LIKE ?", "%#{keyword}%")

    if @products.any?
      @category_name = Category.find(@products.first.category_id).name.capitalize
      @total_category_products_count = Product.where(category_id: @products.first.category_id).count
    end

    @result_type = "search"
  end

  def filter_by_category_name
    keyword = params[:name].downcase
    @category = Category.where("LOWER(name) LIKE ?", "%#{keyword}%").first
    @category_name = @category&.name&.capitalize
    @total_category_products_count = @category&.products&.count || 0
    @products = @products.where(category_id: @category&.id)
  end

  def sort_products
    if params[:category].present?
      case params[:category]
      when "Newest"
        # Sort products by release_date in descending order and apply the last_30_days scope
        @products = @products.last_30_days.order(release_date: :desc)
      when "Lowest Price"
        # Sort products by price in ascending order
        @products = @products.order_by_price_asc
      when "Highest Price"
        # Sort products by price in descending order
        @products = @products.order_by_price_desc
      end
    end
  end
end