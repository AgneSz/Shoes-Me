class Outfit < ApplicationRecord
  EVENT_TYPES = %w[wedding_or_bridal business cocktail_party ball_or_prom party night_out formal_event casual_event date outdoor_event]
  WALKING_TIME = %w[under_one_hour up_to_5_hours more_than_5_hours]
  belongs_to :user
  has_many :shoes, dependent: :destroy
  has_many :feedbacks, through: :shoes
  has_many :outfit_categories
  has_many :categories, through: :outfit_categories
  validates :brand, presence: true
  has_one_attached :photo
end
