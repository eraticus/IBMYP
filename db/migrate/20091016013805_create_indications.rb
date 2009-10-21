class CreateIndications < ActiveRecord::Migration
  def self.up
    create_table :indications do |t|
      t.integer :indicator_id
      t.integer :unit_planner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :indications
  end
end
