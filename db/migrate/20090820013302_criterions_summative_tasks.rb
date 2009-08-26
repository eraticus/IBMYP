class CriterionsSummativeTasks < ActiveRecord::Migration
  def self.up
    create_table(:criterions_summative_tasks, :id=>false) do |t|
      t.integer :criterion_id
      t.integer :summative_task_id
    end
  end

  def self.down
    drop_table(:criterions_summative_tasks)
  end
end
