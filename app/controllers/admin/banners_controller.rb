class Admin::BannersController < Admin::BaseController
  before_action :set_banner, except: [:index, :new, :update_banners, :sort]

  # GET /banners
  def index
    @banners = Banner.all
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
        redirect_to admin_banners_url, notice: '廣告大圖建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      redirect_to admin_banners_url, notice: '廣告大圖更新成功'
    else
      render :edit
    end
  end

  # DELETE /banners/1
  def destroy
    @banner.destroy
    redirect_to admin_banners_url, notice: '廣告大圖已刪除'
  end

  def update_banners
    if banner_params[:banner_ids].any? and banner_params[:banner_positions].any?
      banner_positions = banner_params[:banner_positions]
      banner_ids = banner_params[:banner_ids]
      banner_ids.length.times.each do |i|
        banner = Banner.find(banner_ids[i])
        banner.position = banner_positions[i].to_i if banner_positions[i]
        banner.save
      end
      flash[:notice] = "大圖順序更新完畢！"
    end
    redirect_to admin_banners_path
  end

  def sort
    banner_params[:order].each do |key,value|
      Banner.find(value[:id]).update_attribute(:position, value[:position])
    end
    render :nothing => true
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_banner
    @banner = params[:id] ? Banner.find(params[:id]) : Banner.new(banner_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def banner_params
    params.require(:banner).permit(:position, :image, :title, :link, :published, :button_name,
      {banner_ids: []}, {banner_positions: []}, {order: [:id, :position]})
  end
end
