class Shoe < ApplicationRecord
  belongs_to :outfit
  has_many :feedbacks
  has_many_attached :photos
  validates :brand, presence: true
end
