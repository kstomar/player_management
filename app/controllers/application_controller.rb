# frozen_string_literal: true

# This is our application Controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to after_sign_in_path_for(current_user, exception.message)
  end
  
  protected

  def after_sign_in_path_for(resource, flash_message = nil)
    flash[:alert] = flash_message unless flash_message.nil?
    resource.player? ? user_path(current_user) : organisation_players_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def after_update_path_for(_resource)
    user_path(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password type])
  end
end
