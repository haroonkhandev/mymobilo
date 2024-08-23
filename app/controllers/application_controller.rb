class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.shopkeeper?
      shopkeepers_dashboard_path
    elsif resource.user?
      users_dashboard_path # Updated to match your defined route
    else
      root_path
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
