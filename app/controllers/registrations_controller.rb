class RegistrationsController < Devise::RegistrationsController
  
  
  def new
    fail
  end
  
  def create
    fail
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :institucion, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :institucion, :email, :password, :password_confirmation, :current_password)
  end
end