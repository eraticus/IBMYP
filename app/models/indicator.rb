class Indicator < ActiveRecord::Base
  belongs_to :standard
  
  has_many :indications
  has_many :unit_planners, :through=>:indications
  
end
