class Standard < ActiveRecord::Base
  has_many :indicators
  belongs_to :course
  
  validates_uniqueness_of :label, :scope => [:subject_id]
  
end
