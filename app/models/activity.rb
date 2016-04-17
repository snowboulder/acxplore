class Activity < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :name,        presence: true, length: { maximum: 50 },
                          uniqueness: { case_sensitive: false }
  validates :group,       presence: true, length: { maximum: 50 },
                          inclusion: { in: %w(Sporty Leisure Game),
                          message: "%{value} is not valid. Please select from Sporty/Leisure/Game." }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :range,       presence: true, length: { maximum: 50 }
  validates :duration,    presence: true, length: { maximum: 50 }
  validates :environment, presence: true, length: { maximum: 50 }
  validates :subgroup,                    length: { maximum: 50 }
  validates :season,      presence: true, length: { maximum: 50 }
  validates :min_people,  presence: true, length: { maximum: 2 }
  validates :max_people,  presence: true, length: { maximum: 2 }
  validate  :picture_size

  private
      # Validates the size of an uploaded picture.
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture, "should be less than 5MB")
        end
      end
end
