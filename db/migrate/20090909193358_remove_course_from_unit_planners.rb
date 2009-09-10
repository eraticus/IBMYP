class RemoveCourseFromUnitPlanners < ActiveRecord::Migration
  def self.up
    remove_column :unit_planners, :course
  end

  def self.down
    add_column :unit_planners, :course, :string
  end
end
