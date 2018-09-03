class Admin::CandidatesController < Admin::BaseController
  before_action :set_candidate, except: [:index, :new]

  # GET /candidates
  def index
    @q = Candidate.search(params[:q])
    @candidates = @q.result(distinct: true).page(params[:page])
    if params[:q] and params[:q][:kind_eq]
      @kind = params[:q][:kind_eq]
    else
      @kind = nil
    end
    if params[:q] and params[:q][:year_eq]
      @kind = params[:q][:year_eq]
    else
      @kind = nil
    end
    set_meta_tags({
      title: "候選人管理"
    })
  end

  # GET /candidates/1
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
    set_meta_tags({
      title: "新增候選人"
    })
  end

  # GET /candidates/1/edit
  def edit
    set_meta_tags({
      title: "編輯候選人"
    })
  end

  # POST /candidates
  def create
    if @candidate.save
      redirect_to admin_candidate_url(@candidate), notice: '候選人建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /candidates/1
  def update
    if @candidate.update(candidate_params)
      redirect_to admin_candidate_url(@candidate), notice: '候選人更新成功'
    else
      render :edit
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate.destroy
    redirect_to admin_candidates_url, notice: '候選人已刪除'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = params[:id] ? Candidate.find(params[:id]) : Candidate.new(candidate_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:name, :published, :description, :constituency, 
      :avatar, :avatar_cache, :remove_avatar,
      :image, :image_cache, :remove_image, 
      :help_image, :help_image_cache, :remove_help_image,
      :donate_image, :donate_image_cache, :remove_donate_image,
      :fb_link, :help_link, :donate_form, :job, :education, :experience,
      :year, :kind, :in_campaign)
  end
end
