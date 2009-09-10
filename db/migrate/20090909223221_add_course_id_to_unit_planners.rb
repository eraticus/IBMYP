class AddCourseIdToUnitPlanners < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :course_id, :integer
  end

  def self.down
    remove_column :unit_planners, :course_id
  end
end
