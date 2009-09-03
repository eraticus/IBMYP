class Subject < ActiveRecord::Base
  has_many :standards, :order=>"label" # TODO: remove ASAP
  has_many :unit_planners, :after_add => Proc.new { |s, u| u.objectives.clear}
  has_many :criterions
  has_many :courses
    
end
