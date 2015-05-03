class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, unless: -> { request.format.json? }
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

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || admin_banners_path
  end
end
