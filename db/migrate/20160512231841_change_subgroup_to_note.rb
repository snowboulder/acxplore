class ChangeSubgroupToNote < ActiveRecord::Migration
  def change
    rename_column :activities, :subgroup, :note
  end
end
