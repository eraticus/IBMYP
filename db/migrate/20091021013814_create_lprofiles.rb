class CreateLprofiles < ActiveRecord::Migration
  def self.up
    create_table :lprofiles do |t|
      t.integer :trait_id
      t.integer :unit_planner_id
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :lprofiles
  end
end
