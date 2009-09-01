class CreateYardsticks < ActiveRecord::Migration
  def self.up
    create_table :yardsticks do |t|
      t.integer :standard_id
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
