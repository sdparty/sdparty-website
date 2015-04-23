class Article < ActiveRecord::Base
  has_and_belongs_to_many :keywords, -> { uniq }
  has_and_belongs_to_many :issues, -> { uniq }
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope { includes(:keywords).order(published_at: :desc) }
  scope :published, -> { where(published: true) }
  scope :activities, -> { where(kind: 'activity') }
  scope :presses, -> { where(kind: 'press') }
  scope :issues, -> { where(kind: 'issues') }

  def self.get_keywords
    keywords = []
    includes(:keywords).to_a.map do |a|
      a.keywords.each do |k|
        keywords << k unless keywords.include? k
      end
    end
    return keywords
  end

  def self.keywords_has(keyword_id)
    includes(:keywords).where(keywords: {id: keyword_id})
  end
end
