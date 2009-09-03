class CreateIndicators < ActiveRecord::Migration
  def self.up
    create_table :indicators do |t|
      t.integer :standard_id
      t.string :label
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :indicators
  end
end
