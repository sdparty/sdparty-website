class StaticPagesController < ApplicationController
  def home
    @banners = Banner.published
    @candidates = Candidate.published
  end

  def about
  end

  def donate
    @article = Article.find(1)
  end

  def join
  end

  def programs
  end

  def program01
  end

  def program02
  end

  def program03
  end

  def policies
  end

  def policy01
  end

  def policy02
  end

  def policy03
  end

  def policy04
  end

  def policy05
  end

  def policy06
  end
end
