class Article < ActiveRecord::Base
  has_and_belongs_to_many :issues, -> { uniq }
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope { includes(:keywords).order(published_at: :desc) }
  scope :published, -> { where("published = ? AND published_at <= ?", true, Time.now) }
  scope :activities, -> { where(kind: 'activity') }
  scope :presses, -> { where(kind: 'press') }
  scope :issues, -> { where(kind: 'issues') }

  def self.get_issues
    issues = []
    includes(:issues).to_a.map do |a|
      a.issues.each do |i|
        issues << i unless issues.include? i
      end
    end
    return issues
  end
end
