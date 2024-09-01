class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_root_path # Redirect to ActiveAdmin dashboard for admin users
    elsif resource.is_a?(User)
      if resource.shopkeeper?
        shopkeepers_dashboard_path # Redirect to shopkeeper's dashboard
      else
        root_path # Redirect to user's dashboard (or root path)
      end
    else
      root_path # Default fallback if resource is neither User nor AdminUser
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :phone,
      :birthday,
      :address_line_1,
      :address_line_2,
      :state,
      :country,
      :terms,
      :city
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :first_name,
      :last_name,
      :phone,
      :birthday,
      :address_line_1,
      :address_line_2,
      :state,
      :country,
      :terms,
      :city
    ])
  end
end
