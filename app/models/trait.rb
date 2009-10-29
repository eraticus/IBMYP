#TODO: change name to "Trait"

class Trait < ActiveRecord::Base
  #belongs_to :unit_planner
  has_many :lprofiles , :dependent => :destroy
  
  has_many :unit_planners, :through=>:lprofiles
end
