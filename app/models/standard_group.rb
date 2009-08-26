class StandardGroup < ActiveRecord::Base
  has_many :standard_groups
  belongs_to :subject
end
