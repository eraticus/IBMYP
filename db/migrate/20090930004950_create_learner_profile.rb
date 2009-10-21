class CreateLearnerProfile < ActiveRecord::Migration
  def self.up
    create_table :learner_profiles do |table|
      table.integer :unit_planner_id
      table.string :name
      table.boolean :selected
      table.string :description
      
      table.timestamps
    end
    
    
  end

  def self.down
    drop_table :learner_profiles
  end
end
