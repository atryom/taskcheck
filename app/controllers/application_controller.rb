class ApplicationController < ActionController::Base
  before_filter :update_sanitized_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #
   # @groups = Group.find_all_by_user_id current_user[:id]
  #end

  protected
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

end
