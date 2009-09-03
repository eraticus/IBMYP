class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :subject_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
