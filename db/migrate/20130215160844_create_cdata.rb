class CreateCdata < ActiveRecord::Migration
  def change
    create_table :cdata do |t|
      t.float :value1
      t.float :value2
      t.references :survey

      t.timestamps
    end
    add_index :cdata, :survey_id
  end
end
