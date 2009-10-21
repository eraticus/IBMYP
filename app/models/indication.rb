# join table between indicators and unit planners. Can you think of a better name?
class Indication < ActiveRecord::Base
  
  belongs_to :unit_planner
  belongs_to :indicator
  
end
