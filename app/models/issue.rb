class Issue < ActiveRecord::Base
  has_and_belongs_to_many :articles, -> { uniq }
  default_scope { order(position: :asc) }
  validates_uniqueness_of :position
end
