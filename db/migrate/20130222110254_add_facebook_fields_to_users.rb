class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def change
	add_column :users, :facebook_id, :string
	add_column :users, :facebook_name, :string
  end
end
