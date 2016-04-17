class AddPictureToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :picture, :string
  end
end
