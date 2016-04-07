class AddSeasonToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :season, :string
  end
end
