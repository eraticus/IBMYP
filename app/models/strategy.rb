class Strategy < ActiveRecord::Base
  
  belongs_to :skill
  has_many :approaches
  has_many :unit_planners, :through=>:approaches

  validates_length_of :description, :minimum=>3
  validates_length_of :label, :minimum=>1
end
