class StandardsUnitPlanners < ActiveRecord::Migration
  def self.up
    create_table :standards_unit_planners do |table|
      table.integer :standard_id
      table.integer :unit_planner_id
      
      table.timestamps
    end
  end

  def self.down
    drop_table :standards_unit_planners
  end
end
