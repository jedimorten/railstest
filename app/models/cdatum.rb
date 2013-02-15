class Cdatum < ActiveRecord::Base
  belongs_to :survey
  attr_accessible :value1, :value2
  validates :value1, :presence => true
end
