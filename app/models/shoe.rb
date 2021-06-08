class Shoe < ApplicationRecord
  belongs_to :outfit
  has_many :feedbacks
  validates :brand, presence: true
end
