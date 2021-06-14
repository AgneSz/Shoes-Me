class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :outfit
  validates :content, presence: true
end
