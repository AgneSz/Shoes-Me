class Outfit < ApplicationRecord
  EVENT_TYPES = %w[wedding_or_bridal business cocktail_party ball_or_prom party night_out formal_event casual_event date outdoor_event]
  WALKING_TIME = %w[under_1_hr up_to_5_hrs more_than_5_hrs]
  belongs_to :user
  has_many :shoes, dependent: :destroy
  has_many :feedbacks
  has_many :outfit_categories, dependent: :destroy
  has_many :categories, through: :outfit_categories
  has_one_attached :photo
end
