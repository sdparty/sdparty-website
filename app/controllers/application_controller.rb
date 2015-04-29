class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_admin

  def after_sign_in_path_for(resource)
    admin_banners_path
  end

  private

  def require_admin
    if user_signed_in? and not current_user.admin?
      sign_out current_user
      redirect_to '/'
    end
  end
end
