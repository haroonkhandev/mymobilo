class CompareProductsController < ApplicationController
  def index
    @product_1 = Product.where(id: params[:product_id]).first
    if params[:term].present?
      term = params[:term].downcase
      products = Product.where('LOWER(name) LIKE ?', "%#{term}%").pluck(:name)
      render json: products
    end
  end

  def compare
    @product1 = Product.find_by(name: params[:product1_name])
    @product2 = Product.find_by(name: params[:product2_name])
    # Logic to compare products and generate comparison details
    # ...

    # Render a partial view or JSON response containing comparison details
    respond_to do |format|
      format.js { render 'compare_products/compare' }
    end
  end
end
