class SummativeTask < ActiveRecord::Base
  belongs_to :unit_planner
  has_and_belongs_to_many :criterions, :order=>'category'
  
  def trim_criterions
    return if criterions.empty? # do nothing

    if unit_planner.criterions.empty?
      criterions.clear
    else
      self.criterions = (unit_planner.criterions & self.criterions)
    end
  end

end
