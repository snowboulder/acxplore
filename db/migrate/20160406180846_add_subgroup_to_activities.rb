class AddSubgroupToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :subgroup, :string
  end
end
