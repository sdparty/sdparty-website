class CandidatesController < ApplicationController
  before_action :set_candidate, except: [:index, :new, :proportional]

  # GET /candidates
  def index
    @candidates = Candidate.published
    keywords = "社會民主黨候選人"
    @candidates.each do |c|
      keywords = keywords + ",#{c.name}"
    end
    set_meta_tags({
      title: "區域立委候選人介紹",
      description: "社會民主黨有哪些候選人？他們為什麼要出來參選?一起來了解。",
      keywords: keywords,
      og: {
        type: 'article',
        title: "區域立委候選人介紹",
        description: "社會民主黨有哪些候選人？他們為什麼要出來參選?一起來了解。"
      },
      article: {
        author: Setting.url.fb,
        publisher: Setting.url.fb
      }
    })

    respond_to do |format|
      format.html
      format.json { render :json => {
          status: "success",
          candidates: JSON.parse(
            @candidates.to_json({except: [:published]})
          ),
          count: @candidates.length
          },
        callback: params[:callback]
      }
    end
  end

  def proportional
    set_meta_tags({
      title: "不分區立委候選人介紹",
      description: "綠社盟有哪些不分區候選人？他們為什麼要出來參選?一起來了解。",
      keywords: '張麗芬,李根正,詹順貴,葉大華,謝英俊,許秀雯,尊嚴勞動,永續環境,土地正義,世代正義,居住正義,多元成家',
      og: {
        type: 'article',
        title: "不分區立委候選人介紹",
        description: "綠社盟有哪些不分區候選人？他們為什麼要出來參選?一起來了解。"
      },
      article: {
        author: Setting.url.fb,
        publisher: Setting.url.fb
      }
    })
  end

  # GET /candidates/1
  def show
    not_found unless @candidate.published
    set_meta_tags({
      title: "#{@candidate.name}介紹",
      description: "為什麼#{@candidate.name}要出來參選？一起來深入了解#{@candidate.name}吧！",
      keywords: "#{@candidate.name},#{@candidate.name}介紹",
      og: {
        type: 'article',
        title: "#{@candidate.name}介紹",
        description: "為什麼#{@candidate.name}要出來參選？一起來深入了解#{@candidate.name}吧！"
      },
      article: {
        author: Setting.url.fb,
        publisher: Setting.url.fb
      }
    })

    respond_to do |format|
      format.html
      format.json { render :json => {
          status: "success",
          candidate: JSON.parse(
            @candidate.to_json({except: [:published]})
          )
        },
        callback: params[:callback]
      }
    end
  end

  def donate
    @candidates = Candidate.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = params[:id] ? Candidate.find(params[:id]) : Candidate.new(candidate_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit()
  end
end