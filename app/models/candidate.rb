class Candidate < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  mount_uploader :image, ImageUploader
  mount_uploader :avatar, ImageUploader
  mount_uploader :help_image, ImageUploader
end
