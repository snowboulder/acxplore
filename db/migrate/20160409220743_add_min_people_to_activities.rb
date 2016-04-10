class AddMinPeopleToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :min_people, :integer
  end
end
