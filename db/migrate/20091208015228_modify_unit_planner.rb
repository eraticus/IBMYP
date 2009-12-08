class ModifyUnitPlanner < ActiveRecord::Migration
  def self.up
	change_column(:unit_planners, :learning_activities, :text)
	change_column(:unit_planners, :resources, :text)
  end

  def self.down
  end
end
