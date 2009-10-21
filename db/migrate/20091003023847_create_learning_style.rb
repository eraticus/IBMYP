class CreateLearningStyle < ActiveRecord::Migration
  def self.up
    create_table :learning_style do |table|
      table.integer :unit_planner_id
      table.integer :intelligence_id
      table.boolean :selected
      table.string :description
      
      table.timestamps
    end
    
      create_table :intelligence do |table|
        table.string :name

        table.timestamps
      end
end

  def self.down
    drop_table :learning_style
    drop_table :intelligence
  end
end
