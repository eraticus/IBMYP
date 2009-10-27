class CreateIntelligences < ActiveRecord::Migration
  def self.up
    create_table :intelligences do |t|
      t.string :name
      t.integer :learning_style_id

      t.timestamps
    end
  end

  def self.down
    drop_table :intelligences
  end
end
