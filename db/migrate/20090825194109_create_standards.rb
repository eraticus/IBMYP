class CreateStandards < ActiveRecord::Migration
  def self.up
    create_table :standards do |t|
      t.integer :standard_group_id
      t.string :tag
      t.string :description
      t.boolean :middle
      t.boolean :high

      t.timestamps
    end
  end

  def self.down
    drop_table :standards
  end
end
