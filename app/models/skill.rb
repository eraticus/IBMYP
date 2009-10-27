class Skill < ActiveRecord::Base
  
  has_many :strategies

  validates_length_of :name, :minimum=>3
  validates_length_of :label, :minimum=>1
end
