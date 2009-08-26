class FormativeTask < ActiveRecord::Base
  belongs_to :unit_planner
  has_and_belongs_to_many :objectives, :include=>:criterion, :order=>"criterions.category, objectives.subcategory"

  # call to make sure that the only objectives in the unit_planner are selected
  def trim_objectives
    return if objectives.empty? # do nothing

    if unit_planner.objectives.empty?
      objectives.clear
    else
      self.objectives = (unit_planner.objectives & self.objectives)
    end
  end
end