class Standard < ActiveRecord::Base
  has_many :benchmarks
  belongs_to :subject
  
  validates_uniqueness_of :label, :scope => [:subject_id]
  
end
