class Candidate < ActiveRecord::Base
  scope :published, -> { where(published: true) }
end
