class ActivityPicture < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :activity

  
end
