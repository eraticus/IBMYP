class Intelligence < ActiveRecord::Base
  has_many :learning_styles
  has_many :unit_planners, :through=>:learning_styles
  
  validates_uniqueness_of :name
  
end
