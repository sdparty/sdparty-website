class StaticPagesController < ApplicationController
  def home
    @banners = Banner.published
    @candidates = Candidate.published
  end

  def about
    set_meta_tags({
      title: "黨組織及主要成員",
      description: "社會民主黨是由一群長期關心台灣各個議題的公民所組成。和你一樣，我們對既有政治的不滿已經很久了。現在，我們決定自己捲起袖子，動手打造台灣的新政治。",
      keywords: "社會民主黨,社民黨,公民",
      og: {
        type: 'article',
        title: "黨組織及主要成員",
        description: "社會民主黨是由一群長期關心台灣各個議題的公民所組成。和你一樣，我們對既有政治的不滿已經很久了。現在，我們決定自己捲起袖子，動手打造台灣的新政治。"
      }
    })
  end

  def donate
    @candidates = Candidate.all
    puts @candidates[1].name
    puts @candidates[2].name
    @article = Article.find(1)
    set_meta_tags({
      title: "捐款支持",
      description: "立刻捐款支持社會民主黨，幫助我們一起打造台灣的新政治！",
      keywords: "捐款支持,社會民主黨,社民黨,sdparty",
      og: {
        type: 'article',
        title: "捐款支持",
        description: "立刻捐款支持社會民主黨，幫助我們一起打造台灣的新政治！"
      }
    })
  end

  def join
    set_meta_tags({
      title: "成為黨員",
      description: "加入社會民主黨，成為社會民主黨黨員，一起改革台灣政治！",
      keywords: "成為黨員,入黨申請,成為社會民主黨黨員",
      og: {
        type: 'article',
        title: "成為黨員",
        description: "加入社會民主黨，成為社會民主黨黨員，一起改革台灣政治！"
      }
    })
  end

  def programs
    set_meta_tags({
      title: "政綱",
      description: "政綱內容包含三大類：新經濟、新政治、新社會。一起來了解社會民主黨政綱。",
      keywords: "政綱,政綱草案,新經濟,新政治,新社會",
      og: {
        type: 'article',
        title: "政綱",
        description: "政綱內容包含三大類：新經濟、新政治、新社會。一起來了解社會民主黨政綱。"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def programs_1
    set_meta_tags({
      title: "新經濟政綱",
      description: "新經濟政綱 - 社民黨認為當務之急是改革稅制與產業政策，並強化財產的社會責任。",
      keywords: "新經濟政綱,新經濟,政綱草案",
      og: {
        type: 'article',
        title: "新經濟政綱",
        description: "新經濟政綱 - 社民黨認為當務之急是改革稅制與產業政策，並強化財產的社會責任。"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def programs_2
    set_meta_tags({
      title: "新政治政綱政綱",
      description: "新政治政綱 - 社民黨主張，新的政治力量必須進入國會，重新設定政治議題，改革政治體制，重塑政治文化，最終改變台灣的政治版圖。",
      keywords: "新政治政綱,新政治,政綱草案",
      og: {
        type: 'article',
        title: "新政治政綱政綱",
        description: "新政治政綱 - 社民黨主張，新的政治力量必須進入國會，重新設定政治議題，改革政治體制，重塑政治文化，最終改變台灣的政治版圖。"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def programs_3
    set_meta_tags({
      title: "新社會政綱",
      description: "新社會政綱 - 社民黨主張國家應積極保障社會不同群體尊嚴與基本權益，創造平等的多元社會，促進實質平等與社會正義的實現。",
      keywords: "新社會政綱,新社會,政綱草案",
      og: {
        type: 'article',
        title: "新社會政綱",
        description: "新社會政綱 - 社民黨主張國家應積極保障社會不同群體尊嚴與基本權益，創造平等的多元社會，促進實質平等與社會正義的實現。"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies
    set_meta_tags({
      title: "2016大選的五大政見草案",
      description: "政治能改變這一切。社會民主國家的經驗告訴我們，只要受雇者們能團結、組織起來，對抗財團資本，對抗新自由主義體制，我們就不用再忍受目前的不平等和無奈，可以自由地合作、創造和發展。",
      keywords: "共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "2016大選的五大政見草案",
        description: "政治能改變這一切。社會民主國家的經驗告訴我們，只要受雇者們能團結、組織起來，對抗財團資本，對抗新自由主義體制，我們就不用再忍受目前的不平等和無奈，可以自由地合作、創造和發展。"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies_1
    title = "捍衛勞動權"
    description = "社會民主黨第一箭：提高薪資，捍衛勞動權，強化受雇階級力量"
    set_meta_tags({
      title: "#{title}",
      description: "#{description}",
      keywords: "#{title},共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "#{title}",
        description: "#{description}"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies_2
    title = "全民年金改革"
    description = "社會民主黨第二箭：全民年金大改革，建構平等社會安全體系"
    set_meta_tags({
      title: "#{title}",
      description: "#{description}",
      keywords: "#{title},共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "#{title}",
        description: "#{description}"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies_3
    title = "匡正稅制"
    description = "社會民主黨第三箭：財團富人要加稅，增進國家財政能力，強化財產的社會責任"
    set_meta_tags({
      title: "#{title}",
      description: "#{description}",
      keywords: "#{title},共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "#{title}",
        description: "#{description}"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies_4
    title = "透明監督"
    description = "社會民主黨第四箭：政治要公平透明、要可受監督、要不被收買"
    set_meta_tags({
      title: "#{title}",
      description: "#{description}",
      keywords: "#{title},共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "#{title}",
        description: "#{description}"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies_5
    title = "尊重差異"
    description = "社會民主黨第五箭：尊重差異、反對歧視，共創多元社會"
    set_meta_tags({
      title: "#{title}",
      description: "#{description}",
      keywords: "#{title},共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "#{title}",
        description: "#{description}"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def policies_6
    title = "推動社會經濟"
    description = "社會民主黨之弓：推動「社會經濟」模式，創建兼顧社會正義、社會團結、資源共享的生產方式，管制資本，發展符合社會需求、環境永續、知識與技術創新、在地化與勞工合作的新產業。"
    set_meta_tags({
      title: "#{title}",
      description: "#{description}",
      keywords: "#{title},共同政見,政見草案,2016大選,立委選舉",
      og: {
        type: 'article',
        title: "#{title}",
        description: "#{description}"
      }
    })

    respond_to do |format|
      format.html
      format.json
    end
  end

  def constitution
  end

  def constructing
  end

  def sitemap
    @articles = Article.all
    @candidates = Candidate.all
  end
end
