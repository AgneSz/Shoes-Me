class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :shoe
  validates :content, presence: true
end
