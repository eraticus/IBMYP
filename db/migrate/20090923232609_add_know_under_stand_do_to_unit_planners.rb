class AddKnowUnderStandDoToUnitPlanners < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :know, :text
    add_column :unit_planners, :understand, :text
    add_column :unit_planners, :perform, :text
	remove_column :unit_planners, :unit_content_concepts
	remove_column :unit_planners, :unit_content_skills
  end

  def self.down
    remove_column :unit_planners, :perform
    remove_column :unit_planners, :understand
    remove_column :unit_planners, :know
    add_column :unit_planners, :unit_content_concepts, :text
    add_column :unit_planners, :unit_content_skills, :text
  end
end
