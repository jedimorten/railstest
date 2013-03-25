class RemoveFromSurvey < ActiveRecord::Migration
  def change
	remove_column :surveys, :dataCollection
	add_column :surveys, :dataCollection, :text
  end
end
