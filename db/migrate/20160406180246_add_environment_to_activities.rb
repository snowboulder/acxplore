class AddEnvironmentToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :environment, :string
  end
end
