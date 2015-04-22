class Article < ActiveRecord::Base
  has_and_belongs_to_many :keywords, -> { uniq }
  has_and_belongs_to_many :issues, -> { uniq }
  belongs_to :user
  mount_uploader :image, ImageUploader
  scope :published, -> { where(published: true) }
  scope :activities, -> { where(kind: 'activity') }
  scope :presses, -> { where(kind: 'press') }
  scope :issues, -> { where(kind: 'issues') }
end
