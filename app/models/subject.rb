class Subject < ActiveRecord::Base
  has_many :standard_groups
  has_many :unit_planners, :after_add => Proc.new { |s, u| u.objectives.clear}
  has_many :criterions
  
  def titleize
    name.titleize
  end
end
