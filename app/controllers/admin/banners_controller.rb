class Admin::BannersController < Admin::BaseController
  before_action :set_banner, except: [:index, :new]

  # GET /banners
  def index
    @banners = Banner.all.page
  end

  # GET /banners/1
  def show
  end

  # GET /banners/new
  def new
    @banner = Banner.new
  end

  # GET /banners/1/edit
  def edit
  end

  # POST /banners
  def create
    if @banner.save
        redirect_to @banner, notice: '關鍵字建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      redirect_to @banner, notice: '關鍵字更新成功'
    else
      render :edit
    end
  end

  # DELETE /banners/1
  def destroy
    @banner.destroy
    redirect_to banners_url, notice: '關鍵字已刪除'
  end

  def update_banners
    if admin_params[:banner_ids]
      @banners = Video.find(admin_params[:banner_ids])
      unpublished_ids = admin_params[:unpublished_ids] ? admin_params[:unpublished_ids] : []
      @banners.each do |b|
        if unpublished_ids.include?(b.id.to_s)
          if b.published == true
            b.published = false
            b.save
          end
        else
          if b.published == false
            b.published = true
            b.save
          end
        end
      end
      flash[:notice] = "影片更新完畢！"
    end
    redirect_to admin_banners_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_banner
    @banner = params[:id] ? Banner.find(params[:id]) : Banner.new(banner_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def banner_params
    params.require(:banner).permit(:position, :image, :title, :link, :published)
  end
end
