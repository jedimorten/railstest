class RenameFieldsInSurvey < ActiveRecord::Migration
  def change
        rename_column :surveys, :var_name1, :varName1
        rename_column :surveys, :var_name2, :varName2
        rename_column :surveys, :time_unit1, :timeUnit1
        rename_column :surveys, :time_unit2, :timeUnit2
        rename_column :surveys, :number_of_categories, :numberOfCategories
        rename_column :surveys, :num_of_vals, :numOfVals
        rename_column :surveys, :current_id_of_data, :currentIdOfData
  end
end
