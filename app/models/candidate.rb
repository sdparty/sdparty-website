class Candidate < ApplicationRecord
  scope :published, -> { where(published: true) }

  scope :year, lambda { |year| where(year: year) }
  scope :presidents, -> { where(kind: 'president') }
  scope :legislators, -> { where(kind: 'legislator') }
  scope :mayors, -> { where(kind: 'mayor') }
  scope :councilors, -> { where(kind: 'councilor') }

end
