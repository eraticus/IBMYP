class CreateObjectives < ActiveRecord::Migration
  def self.up
    create_table :objectives do |t|
      t.string :subject_area
      t.string :category
      t.string :subcategory
      t.text :description
      t.integer :criterion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :objectives
  end
end
