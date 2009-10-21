class Lprofile < ActiveRecord::Base
  belongs_to :unit_planner
  belongs_to :learner_profile
end
