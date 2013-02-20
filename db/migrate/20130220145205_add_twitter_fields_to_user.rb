class AddTwitterFieldsToUser < ActiveRecord::Migration
  def change
	

	add_column :users, :twitter_display_name, :string
  end
end
