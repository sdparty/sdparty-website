class Admin::IssuesController < Admin::BaseController
  before_action :set_issue, except: [:index, :new, :update_issues, :sort]

  # GET /issues
  def index
    @issues = Issue.all
    set_meta_tags({
      title: "文章子分類管理"
    })
  end

  # GET /issues/1
  def show
    @articles = @issue.articles.page params[:page]
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    set_meta_tags({
      title: "新增文章子分類"
    })
  end

  # GET /issues/1/edit
  def edit
    set_meta_tags({
      title: "編輯文章子分類"
    })
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to admin_issues_url, notice: '子分類成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      redirect_to admin_issues_url, notice: '子分類成功更新！'
    else
      render :edit
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
    redirect_to admin_issues_url, notice: '子分類成功刪除！'
  end

  def update_issues
    if issue_params[:issue_ids].any? and issue_params[:issue_positions].any?
      issue_positions = issue_params[:issue_positions]
      issue_ids = issue_params[:issue_ids]
      issue_ids.length.times.each do |i|
        issue = Issue.find(issue_ids[i])
        issue.position = issue_positions[i].to_i if issue_positions[i]
        issue.save
      end
      flash[:notice] = "子分類順序更新完畢！"
    end
    redirect_to admin_issues_url
  end

  def sort
    issue_params[:order].each do |key,value|
      Issue.find(value[:id]).update_attribute(:position, value[:position])
    end
    render :nothing => true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = params[:id] ? Issue.find(params[:id]) : Issue.new(issue_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:name, :published, {issue_ids: []}, {issue_positions: []},
      {order: [:id, :position]})
  end
end