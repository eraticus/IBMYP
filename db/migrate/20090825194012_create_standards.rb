class CreateStandards < ActiveRecord::Migration
  def self.up
    create_table :standards do |t|
      t.integer :subject_id
      t.integer :course_id
      t.string :label
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :standards
  end
end
