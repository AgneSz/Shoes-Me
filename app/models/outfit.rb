class Outfit < ApplicationRecord
  belongs_to :user
  has_many :shoes, dependent: :destroy
  has_many :feedbacks, through: :shoes
  validates :brand, presence: true
  has_one_attached :photo
end
