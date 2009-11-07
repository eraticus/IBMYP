#That is, standards coverage
class Coverage < ActiveRecord::Base
  belongs_to :unit_planner
  belongs_to :standard
end
