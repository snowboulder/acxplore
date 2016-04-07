class AddIndexToActivitiesName < ActiveRecord::Migration
  def change
    add_index :activities, :name, unique: true
  end
end
