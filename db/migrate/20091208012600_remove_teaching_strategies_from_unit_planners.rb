class RemoveTeachingStrategiesFromUnitPlanners < ActiveRecord::Migration
  def self.up
    remove_column :unit_planners, :teaching_strategies
  end

  def self.down
    add_column :unit_planners, :teaching_strategies, :text
  end
end
