class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name,
        :lastname,
        :phone_number,
        :identification_type,
        :identification_number,
        :email,
        :password,
        :password_confirmation,
        address_attributes: %i[id street city state country]
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name,
        :lastname,
        :phone_number,
        :identification_type,
        :identification_number,
        :email,
        :password,
        :current_password,
        :password_confirmation,
        address_attributes: %i[id street city state country]
      )
    end
  end
end
