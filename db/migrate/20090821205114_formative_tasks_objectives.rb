class FormativeTasksObjectives < ActiveRecord::Migration
  def self.up
    create_table(:formative_tasks_objectives, :id=>false) do |table|
      table.integer :objective_id
      table.integer :formative_task_id
    end
  end

  def self.down
    drop_table :formative_tasks_objectives
  end
end
