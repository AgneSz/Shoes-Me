class Outfit < ApplicationRecord
  include ActionView::Helpers::TextHelper
  EVENT_TYPES = %w[wedding_or_bridal business cocktail_party ball_or_prom party night_out formal_event casual_event date outdoor_event]
  WALKING_TIME = %w[under_one_hour up_to_5_hours more_than_5_hours]
  belongs_to :user
  has_many :shoes, dependent: :destroy
  has_many :feedbacks
  has_many :outfit_categories, dependent: :destroy
  has_many :categories, through: :outfit_categories
  has_one_attached :photo

  def time_left
    hours = ((event_date - Time.now)/3600).round
    if hours < 24
      return pluralize(hours, 'hour')
    else
      return pluralize(hours/24, 'day')
    end
  end
end
