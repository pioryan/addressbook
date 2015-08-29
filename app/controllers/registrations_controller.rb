class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password)
  end
end