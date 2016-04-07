class Activity < ActiveRecord::Base
  validates :name,        presence: true, length: { maximum: 50 },
                          uniqueness: { case_sensitive: false }
  validates :group,       presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :range,       presence: true, length: { maximum: 50 }
  validates :duration,    presence: true, length: { maximum: 50 }
  validates :environment, presence: true, length: { maximum: 50 }
  validates :subgroup,    presence: true, length: { maximum: 50 }
  validates :season,      presence: true, length: { maximum: 50 }
end
