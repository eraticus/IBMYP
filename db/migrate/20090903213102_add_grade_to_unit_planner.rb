class AddGradeToUnitPlanner < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :grade, :integer
    remove_column :unit_planners, :standards
  end

  def self.down
    remove_column :unit_planners, :grade
    add_column :unit_planners, :standards, :string
    
  end
end
