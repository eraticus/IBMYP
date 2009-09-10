class RemoveCourseIdFromStandards < ActiveRecord::Migration
  def self.up
    remove_column :standards, :course_id
  end

  def self.down
    add_column :standards, :course_id, :integer
  end
end
