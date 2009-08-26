class Criterion < ActiveRecord::Base
  belongs_to :subject
  has_many :objectives, :order=>"subcategory"
  has_and_belongs_to_many :summative_tasks
  
  # # used by unit_planner in the Summative Assessment Tasks MYP Criteria
  # #TODO: delete ASAP
  # has_and_belongs_to_many :unit_planners
  
  #summative tasks moved out into own class
  has_and_belongs_to_many :summative_tasks
end
