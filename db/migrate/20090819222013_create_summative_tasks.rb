class CreateSummativeTasks < ActiveRecord::Migration
  def self.up
    create_table :summative_tasks do |t|
      t.integer :unit_planner_id
      t.string :description
      t.integer :level
      t.string :task

      t.timestamps
    end
  end

  def self.down
    drop_table :summative_tasks
  end
end
