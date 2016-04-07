class AddRangeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :range, :string
  end
end
