class Standard < ActiveRecord::Base
  has_many :indicators
  belongs_to :subject

  has_many :coverages, :dependent=>:destroy
  has_many :unit_planners, :through=>:coverages
  
  validates_uniqueness_of :label, :scope => [:subject_id]
  
end
