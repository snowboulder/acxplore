class Activity < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :activity_pictures, dependent: :destroy
  accepts_nested_attributes_for :activity_pictures, allow_destroy: true
  mount_uploader :avatar, PictureUploader
  validates :name,        presence: true, length: { maximum: 50 },
                          uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :range,       presence: true, length: { maximum: 50 }
  validates :duration,    presence: true, length: { maximum: 50 }
  validates :environment, presence: true, length: { maximum: 50 }
  validates :note,                        length: { maximum: 50 }
  validates :season,      presence: true, length: { maximum: 50 }
  validates :min_people,  presence: true, length: { maximum: 2 }
  validates :max_people,  presence: true, length: { maximum: 2 }
  validate  :avatar_size

  private
      # Validates the size of an uploaded picture.
      def avatar_size
        if avatar.size > 5.megabytes
          errors.add(:avatar, "should be less than 5MB")
        end
      end
end
