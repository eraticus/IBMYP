class CreateApproaches < ActiveRecord::Migration
  def self.up
    create_table :approaches do |t|
      t.string :name
      t.integer :unit_planner_id
      t.integer :strategy_id

      t.timestamps
    end
  end

  def self.down
    drop_table :approaches
  end
end
