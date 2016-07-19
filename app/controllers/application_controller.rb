class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, unless: -> { request.format.json? }
  # before_action :require_admin

  def after_sign_in_path_for(resource)
    admin_banners_path
  end

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    # payload[:user_id] = current_user.id if current_user
    if request.env['HTTP_CF_CONNECTING_IP']
      payload[:ip] = request.env['HTTP_CF_CONNECTING_IP']
    elsif request.env["HTTP_X_FORWARDED_FOR"]
      payload[:ip] = request.env["HTTP_X_FORWARDED_FOR"]
    else
      payload[:ip] = request.env['REMOTE_ADDR']
    end
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
    if current_user.admin
      request.env['omniauth.origin'] || stored_location_for(resource) || admin_banners_path
    else
      sign_out current_user
      root_path
    end
  end

  def display_shorter(str, length, additional = "...")
    length = length * 2
    text = Nokogiri::HTML(str).text
    if text.display_width >= length
      additional_text = Nokogiri::HTML(additional).text
      new_length = length - additional_text.display_width
      short_string = text[0..new_length]
      while short_string.display_width > new_length
        short_string = short_string[0..-2]
      end
      short_string + additional
    else
      text
    end
  end
end
