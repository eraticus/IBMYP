class AddDescriptionToApproach < ActiveRecord::Migration
  def self.up
    add_column :approaches, :description, :text
  end

  def self.down
    remove_column :approaches, :description
  end
end
