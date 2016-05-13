class RemoveGroupFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :group, :string
  end
end
