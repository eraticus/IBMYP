class AddPrDaToUnitPlanners < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :prior_knowledge, :text
    add_column :unit_planners, :diagnostic_assessments, :text
	remove_column :unit_planners, :learning_readiness
  end

  def self.down
    remove_column :unit_planners, :diagnostic_assessments
    remove_column :unit_planners, :prior_knowledge
	add_column :unit_planners, :learning_readiness, :text
  end
end
