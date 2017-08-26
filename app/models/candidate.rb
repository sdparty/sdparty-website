class Candidate < ApplicationRecord
  scope :published, -> { where(published: true) }
end
