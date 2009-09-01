class CreateLearnerProfiles < ActiveRecord::Migration
  def self.up
    create_table :learner_profiles do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :learner_profiles
  end
end
