class Issue < ActiveRecord::Base
  has_and_belongs_to_many :articles, -> { uniq }
  default_scope { order(position: :asc) }
  validates_uniqueness_of :name, message: '名稱不得重複'

  before_destroy :detect_articles
  validates_presence_of :name, message: '請填寫名稱'
  before_save :set_position

  def set_position
    if not self.position
      self.position = Issue.maximum("position").to_i + 1
    end
  end

  private

  def detect_articles
    if articles.any?
      return false
    end
  end
end
