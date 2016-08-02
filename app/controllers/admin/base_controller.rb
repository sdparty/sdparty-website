class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_action :require_admin, :set_system_articles

  def upload
    allowed_exts = ['gif', 'jpeg', 'jpg', 'png']
    allowed_types = ["image/gif", "image/jpeg", "image/jpg", "image/pjpeg", "image/x-png", "image/png"]

    extension = params['file'].original_filename.split('.').last

    if allowed_types.include?(params['Content-Type']) && allowed_exts.include?(extension)
      name = Digest::SHA1.hexdigest Time.now.to_f.to_s
      img_path = Rails.root.join('public', 'uploads', name + '.' + extension)
      FileUtils.mv params['file'].tempfile, img_path
      web_img_path = '/uploads/' + name + '.' + extension
      render json: {:link => web_img_path}
    end
  end

  private

  def require_admin
    unless current_user.admin?
      sign_out current_user
      redirect_to '/'
    end
  end

  def set_system_articles
    @donate_article = Article.where(kind: 'system', system_type: 'donate').first
  end

end
