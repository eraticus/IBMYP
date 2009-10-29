class CreateTraits < ActiveRecord::Migration
  def self.up
    create_table :traits do |t|
	t.text :name
      t.timestamps
    end
  end

  def self.down
    drop_table :traits
  end
end
