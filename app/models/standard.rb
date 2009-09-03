class Standard < ActiveRecord::Base
  has_many :benchmarks
  belongs_to :course
  
  validates_uniqueness_of :label, :scope => [:subject_id]
  
end
