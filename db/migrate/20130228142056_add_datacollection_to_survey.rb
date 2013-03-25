class AddDatacollectionToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :dataCollection, :string
  end
end
