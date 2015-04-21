class BannersController < Admin::BaseController
  before_action :set_banner, except: [:index, :new]

  # GET /banners
  def index
    @banners = Banner.all.page params[:page]
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
