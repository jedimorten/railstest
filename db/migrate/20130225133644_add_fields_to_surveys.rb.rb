class AddFieldsToSurveys.rb < ActiveRecord::Migration
  def change
	add_column :surveys, :type, :string 
	add_column :surveys, :local_id, :string
	add_column :surveys, :var_name1, :string
	add_column :surveys, :var_name2, :string
	add_column :surveys, :names1, :string
	add_column :surveys, :names2, :string
	add_column :surveys, :units, :string
	add_column :surveys, :time_unit1, :string
	add_column :surveys, :time_unit2, :string
	add_column :surveys, :number_of_categories, :string
	add_column :surveys, :num_of_vals, :integer
	add_column :surveys, :current_id_of_data, :integer
  end
end
