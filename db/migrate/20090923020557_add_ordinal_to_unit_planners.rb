class AddOrdinalToUnitPlanners < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :unit_order, :integer
    add_column :unit_planners, :num_weeks, :integer
    remove_column :unit_planners, :time_frame
  end

  def self.down
    remove_column :unit_planners, :unit_order
	remove_column :unit_planners, :num_weeks
	add_column :unit_planners, :time_frame, :string
  end
end
