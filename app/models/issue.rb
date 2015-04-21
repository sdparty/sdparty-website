class Issue < ActiveRecord::Base
  has_many :articles
  default_scope { order(position: :asc) }
  validates_uniqueness_of :position
end
