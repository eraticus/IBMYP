class CreateCoverages < ActiveRecord::Migration
  def self.up
    create_table :coverages, :id => false do |t|
      t.integer :unit_planner_id
      t.integer :standard_id

      t.timestamps
    end
    drop_table :standards_unit_planners
  end

  def self.down
    drop_table :coverages

    create_table :standards_unit_planners, :id => false do |t|
      t.integer :unit_planner_id
      t.integer :standard_id

      t.timestamps
    end

  end
end
