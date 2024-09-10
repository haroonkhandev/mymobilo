module ApplicationHelper
  def shopkeeper_landing_nav?
    return false unless current_user&.shopkeeper?

    # List of paths where the shopkeeper_landing_nav partial should be shown
    valid_paths = [
      root_path,
      compare_products_index_path,
      compare_products_compare_path
    ]

    # Add the products#show route if the product ID is present
    if params[:id].present? && controller_name == 'products' && action_name == 'show'
      valid_paths << product_path(params[:id])
    end

    # Add the articles#index route
    if controller_name == 'articles' && action_name == 'index'
      valid_paths << articles_path
    end

    # Add the articles#show route if the article ID is present
    if params[:id].present? && controller_name == 'articles' && action_name == 'show'
      valid_paths << article_path(params[:id])
    end

    # Add the article_categories#index route
    if controller_name == 'article_categories' && action_name == 'index'
      valid_paths << article_categories_path
    end

    # Add the article_categories#show route if the category ID is present
    if params[:id].present? && controller_name == 'article_categories' && action_name == 'show'
      valid_paths << article_category_path(params[:id])
    end

    # Add the subcategories path if a category_id is present
    if params[:category_id].present?
      valid_paths << subcategories_path(category_id: params[:category_id])
    end

    # Check if current path is in the list of valid paths
    valid_paths.include?(request.path)
  end
end