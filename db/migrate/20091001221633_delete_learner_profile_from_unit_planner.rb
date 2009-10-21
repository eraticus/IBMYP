class DeleteLearnerProfileFromUnitPlanner < ActiveRecord::Migration
  def self.up
	remove_column :unit_planners, :learner_profile

  end

  def self.down
    add_column :unit_planners, :learner_profile, :text
  end
end
