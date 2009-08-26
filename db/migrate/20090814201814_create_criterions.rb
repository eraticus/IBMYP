class CreateCriterions< ActiveRecord::Migration
  def self.up
    create_table :criterions do |t|
      t.string :subject_id 
      t.string :category # used for sorting
      t.string :title # description
    
      t.timestamps
    end
  end

  def self.down
   drop_table :criterions
  end
end
