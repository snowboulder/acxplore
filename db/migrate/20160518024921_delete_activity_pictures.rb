class DeleteActivityPictures < ActiveRecord::Migration
  def down
    ActivityPicture.delete_all
  end
end
