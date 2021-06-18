class Outfit < ApplicationRecord
include ActionView::Helpers::TextHelper
  EVENT_TYPES = %w[wedding_or_bridal business cocktail_party ball_or_prom party night_out formal_event casual_event a_date outdoor_event]
  WALKING_TIME = %w[under_1_hr up_to_5_hrs more_than_5_hrs]
  belongs_to :user
  has_many :shoes, dependent: :destroy
  has_many :feedbacks
  has_many :outfit_categories, dependent: :destroy
  has_many :categories, through: :outfit_categories
  has_one_attached :photo
  self.per_page = 6


  def event_type_icon
    if event_type == "date" || event_type == "a_date"
      return "far fa-kiss-wink-heart"
    elsif event_type == "wedding_or_bridal"
      return "fas fa-dove"
    elsif event_type == "business"
      return "fas fa-briefcase"
    elsif event_type == "cocktail_party"
      return "fas fa-cocktail"
    elsif event_type == "ball_or_prom"
      return "fas fa-music"
    elsif event_type == "party"
      return "fas fa-birthday-cake"
    elsif event_type == "night_out"
      return "fas fa-glass-cheers"
    elsif event_type == "formal_event"
      return "fas fa-user-tie"
    elsif event_type == "casual_event"
      return "fas fa-tshirt"
    elsif event_type == "outdoor_event"
      return "fas fa-tree"
    end
  end

  def walking_time_icon
    if walking_time == "under_1_hr" || walking_time == "under_one_hour"
      return "fas fa-walking"
    elsif walking_time == "up_to_5_hrs" || walking_time == "up_to_5_hours"
      return "fas fa-running"
    elsif walking_time == "more_than_5_hrs" || walking_time == "more_than_5_hours"
      return "fas fa-hiking"
    end
  end
  
  def time_left
    hours = ((event_date - Time.now)/3600).round
    if hours < 24
      return pluralize(hours, 'hour')
    else
      return pluralize(hours/24, 'day')
    end
  end
end
