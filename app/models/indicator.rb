class Indicator < ActiveRecord::Base
  belongs_to :standard
  
  has_many :indications, :dependent => :destroy
  has_many :unit_planners, :through=>:indications
  
end
