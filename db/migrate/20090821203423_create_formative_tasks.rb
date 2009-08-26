class CreateFormativeTasks < ActiveRecord::Migration
  def self.up
    create_table :formative_tasks do |t|
      t.string :description
      t.integer :level
      t.integer :unit_planner_id
      t.string :task

      t.timestamps
    end
  end

  def self.down
    drop_table :formative_tasks
  end
end
