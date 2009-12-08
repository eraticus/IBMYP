class AddLearningExtensionToUnitPlanner < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :learning_extension, :text
    add_column :unit_planners, :summative_exemplars, :text
  end

  def self.down
    remove_column :unit_planners, :learning_extension
    remove_column :unit_planners, :summative_exemplars
  end
end
