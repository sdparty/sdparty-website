class Banner < ActiveRecord::Base
  default_scope { order(position: :asc) }
  validates_uniqueness_of :position
  mount_uploader :image, ImageUploader
  scope :published, -> { where(published: true) }
end
