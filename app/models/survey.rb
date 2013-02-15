class Survey < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :cdata, :dependent => :delete_all
  validates :title, :presence => true
end
