class SummativeTask < ActiveRecord::Base
  belongs_to :unit_planner
  has_and_belongs_to_many :criterions, :order=>'category'
  
  validates_presence_of :description
  validates_presence_of :task
  
  def validate
    if criterions.empty? and not unit_planner.objectives.empty?
      errors.add(:criterions, "At least one criterion is required")
    end
  end
  
  def trim_criterions
    return if criterions.empty? # do nothing

    if unit_planner.criterions.empty?
      criterions.clear
    else
      self.criterions = (unit_planner.criterions & self.criterions)
    end
  end

end
