class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :new, :presses, :activities, :issues]

  # GET /articles
  def index
    @articles = Article.all.page params[:page]
  end

  # GET /articles/1
  def show
    unless @article.published
      not_found
    end
    issues = @article.issues.to_a.map{ |i| i.name }.join(',')
    if @article.kind = 'press'
      set_meta_tags({
        title: @article.title,
        description: @article.title,
        keywords: "#{@article.title},#{issues},新聞稿,社民黨新聞稿",
        og: {
          type: 'article',
          title: @article.title,
          description: @article.title
        }
      })
    elsif @article.kind = 'activity'
      set_meta_tags({
        title: @article.title,
        description: @article.title,
        keywords: "#{@article.title},#{issues},活動資訊,社民黨活動",
        og: {
          type: 'article',
          title: @article.title,
          description: @article.title
        }
      })
    elsif @article.kind = 'issue'
      set_meta_tags({
        title: @article.title,
        description: @article.title,
        keywords: "#{@article.title},#{issues},熱門議題,社民黨議題",
        og: {
          type: 'article',
          title: @article.title,
          description: @article.title
        }
      })
    end
  end

  def presses
    unless params[:i].blank?
      @issue = Issue.find(params[:i])
      @issue = nil unless @issue
    end
    if @issue
      @articles = @issue.articles.scope_presses.published.page params[:page]
    else
      @articles = Article.scope_presses.published.page params[:page]
    end
    @issues = Article.scope_presses.published.get_issues
    set_meta_tags({
      title: "新聞稿",
      description: "社會民主黨發新聞稿啦！所有社會民主黨的新稿資訊都在這！",
      keywords: "新聞,新聞稿,社民黨新聞稿",
      og: {
        type: 'article',
        title: "新聞稿",
        description: "社會民主黨發新聞稿啦！所有社會民主黨的新稿資訊都在這！"
      }
    })
  end

  def activities
    unless params[:i].blank?
      @issue = Issue.find(params[:i])
      @issue = nil unless @issue
    end
    if @issue
      @articles = @issue.articles.scope_activities.published.page params[:page]
    else
      @articles = Article.scope_activities.published.page params[:page]
    end
    @issues = Article.scope_activities.published.get_issues
    set_meta_tags({
      title: "近期活動",
      description: "想知道關於社會民主黨的最新活動嗎？所有社會民主黨活動資訊都在近期活動中。",
      keywords: "近期活動,活動資訊,社民黨活動",
      og: {
        type: 'article',
        title: "近期活動",
        description: "想知道關於社會民主黨的最新活動嗎？所有社會民主黨活動資訊都在近期活動中。"
      }
    })
  end

  def issues
    unless params[:i].blank?
      @issue = Issue.find(params[:i])
      @issue = nil unless @issue
    end
    if @issue
      @articles = @issue.articles.scope_issues.published.page params[:page]
    else
      @articles = Article.scope_issues.published.page params[:page]
    end
    @issues = Article.scope_issues.published.get_issues
    set_meta_tags({
      title: "熱門議題",
      description: "想了解社民黨針對各種特定熱門議題的看法嗎？帶你來了解。",
      keywords: "熱門議題,議題討論,社民黨議題",
      og: {
        type: 'article',
        title: "熱門議題",
        description: "想了解社民黨針對各種特定熱門議題的看法嗎？帶你來了解。"
      }
    })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = params[:id] ? Article.find(params[:id]) : Article.new(article_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:user_id, :published, :published_at, 
      :iind, :image, :title, :content, :youtube_url)
  end

  def get_issues(articles)
    issues = []
    articles.to_a.map do |a|
      a.issues.each do |k|
        issues << k unless issues.include? k
      end
    end
    return issues
  end
end
