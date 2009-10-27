class Approach < ActiveRecord::Base
  
  belongs_to :unit_planner
  belongs_to :strategy
  
end
