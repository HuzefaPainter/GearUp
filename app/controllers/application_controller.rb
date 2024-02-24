class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters ,if: :devise_controller?
  before_action :authenticate_user!, if!: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :password, :current_password)}
  end

  def authenticate_user!
    unless user_signed_in? || (controller_name == 'sessions' && action_name == 'new') || (controller_name == 'registrations' && action_name == 'new') || (controller_name == 'registrations' && action_name == 'create')

      Rails.logger.debug "User not signed in. Redirecting to login page."
      Rails.logger.debug "controller_name was #{controller_name} and action_name was #{action_name}."
      redirect_to new_user_session_path
    end
  end
end
