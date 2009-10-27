class CreateLearningStyles < ActiveRecord::Migration
  def self.up
    create_table :learning_styles do |t|
      t.string :description
      t.integer :intelligence_id
      t.integer :unit_planner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :learning_styles
  end
end
