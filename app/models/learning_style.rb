class LearningStyle < ActiveRecord::Base
  belongs_to :unit_planner
  belongs_to :intelligence
end
