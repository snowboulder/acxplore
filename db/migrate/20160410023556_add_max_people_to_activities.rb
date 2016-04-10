class AddMaxPeopleToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :max_people, :integer
  end
end
