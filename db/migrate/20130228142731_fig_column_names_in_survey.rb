class FigColumnNamesInSurvey < ActiveRecord::Migration
  def change
	rename_column :surveys, :type, :typeOfSurvey
  end
end
