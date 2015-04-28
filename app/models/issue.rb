class Issue < ActiveRecord::Base
  has_and_belongs_to_many :articles, -> { uniq }
  default_scope { order(position: :asc) }
  validates_uniqueness_of :name

  before_destroy :detect_articles

  private

  def detect_articles
    if articles.any?
      return false
    end
  end
end
