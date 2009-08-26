class SummativeCriterion < ActiveRecord::Base
  belongs_to :unit_planner
  belongs_to :criterion
end
