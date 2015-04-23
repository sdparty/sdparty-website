class IssuesController < ApplicationController
  before_action :set_issue, except: [:index, :new]

  # GET /issues
  def index
    @issues = Issue.all.page params[:page]
  end

  # GET /issues/1
  def show
    @articles = @issue.articles.page params[:page]
    unless params[:k].blank?
      @keyword = keyword.find(params[:k])
      @keyword = nil unless @keyword
    end
    if @keyword
      @articles = @issue.articles.keywords_has(@keyword.id).page params[:page]
    else
      @articles = @issue.articles.page params[:page]
    end
    @keywords = Article.issues.get_keywords
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
        redirect_to @issue, notice: 'Issue was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      redirect_to @issue, notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
    redirect_to issues_url, notice: 'Issue was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = params[:id] ? Issue.find(params[:id]) : Issue.new(issue_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:name, :published)
  end
end