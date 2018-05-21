class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	user_path(current_user.id)
  end

  def ensure_correct_user
  	if current_user.id != params[:id].to_i
  		redirect_to posts_path
  	end
  end

protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

end

