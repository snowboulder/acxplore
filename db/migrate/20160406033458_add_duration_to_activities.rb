class AddDurationToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :duration, :string
  end
end
