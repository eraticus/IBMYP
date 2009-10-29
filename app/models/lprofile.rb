#TODO: rename to "LearnerProfile"

class Lprofile < ActiveRecord::Base
  
  #validates_length_of :description, :minimum=> 2, :message=>"How will the development of this trait be supported in this unit?"
  
  belongs_to :unit_planner
  belongs_to :trait
end
