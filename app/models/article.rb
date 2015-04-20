class Article < ActiveRecord::Base
  has_and_belongs_to_many :keywords, -> { uniq }
  belongs_to :category
  belongs_to :user
  mount_uploader :image, ImageUploader
end
