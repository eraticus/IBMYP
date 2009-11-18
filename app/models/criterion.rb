class Criterion < ActiveRecord::Base
  belongs_to :subject
  has_many :objectives, :order=>"subcategory",  :dependent => :destroy
  has_and_belongs_to_many :summative_tasks
end
