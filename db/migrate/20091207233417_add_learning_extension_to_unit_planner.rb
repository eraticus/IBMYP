class AddLearningExtensionToUnitPlanner < ActiveRecord::Migration
  def self.up
    add_column :unit_planners, :learning_extension, :text
  end

  def self.down
    remove_column :unit_planners, :learning_extension
  end
end
