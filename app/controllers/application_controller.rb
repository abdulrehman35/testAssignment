class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


  def authenticate_admin_user!
    #debugger
    if (!current_user.present? || !current_user.has_role?( :Admin))
      redirect_to root_path, alert: 'Unauthorized Access'
    end
  end

  def current_admin_user
    current_user
  end

	protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}


   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
end
end
