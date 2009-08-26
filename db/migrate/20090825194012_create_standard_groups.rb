class CreateStandardGroups < ActiveRecord::Migration
  def self.up
    create_table :standard_groups do |t|
      t.string :tag
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :standard_groups
  end
end
