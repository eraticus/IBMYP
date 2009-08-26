class ObjectivesUnitPlanners < ActiveRecord::Migration
  def self.up
    create_table(:objectives_unit_planners, :id=>false) do |t|
      t.integer :objective_id
      t.integer :unit_planner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :objectives_unit_planners
  end
end
