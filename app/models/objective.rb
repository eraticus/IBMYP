class Objective < ActiveRecord::Base
  belongs_to :criterion
  has_and_belongs_to_many :unit_planners
  has_and_belongs_to_many :formative_tasks
    
end
