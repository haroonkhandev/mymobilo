class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
