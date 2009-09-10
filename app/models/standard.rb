class Standard < ActiveRecord::Base
  has_many :indicators
  belongs_to :subject
  has_and_belongs_to_many :unit_planner
  
  validates_uniqueness_of :label, :scope => [:subject_id]
  
end
