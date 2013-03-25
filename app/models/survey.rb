class Survey < ActiveRecord::Base
  attr_accessible :title, :description, :local_id, :typeOfSurvey, :varName1, :varName2, :names1, :names2, :units, :timeUnit1, :timeUnit2, :numberOfCategories, :numOfVals, :currentIdOfData, :dataCollection 
  
  belongs_to :user
  validates :title, :presence => true
end
