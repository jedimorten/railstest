class Survey < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :cdata, :dependent => :delete_all
  belongs_to :user
  validates :title, :presence => true
end
