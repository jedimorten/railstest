class Survey < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :cdata
  validates :title, :presence => true
end
