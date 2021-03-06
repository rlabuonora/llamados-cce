class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
     
    devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :email, :password, :password_confirmation, :name, :institucion ) }
    devise_parameter_sanitizer.permit(:account_update)  { |u| u.permit(  :email, :password, :password_confirmation, :name, :institucion, :current_password ) }


  end
end