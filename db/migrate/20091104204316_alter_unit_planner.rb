class AlterUnitPlanner < ActiveRecord::Migration
  def self.up
	change_column(:unit_planners, :significant_concept, :text)
	change_column(:unit_planners, :unit_question, :text)
	change_column(:unit_planners, :subject_area_question, :text)
  end

  def self.down
  end
end
