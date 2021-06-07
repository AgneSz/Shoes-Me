class Outfit < ApplicationRecord
  belongs_to :user
  has_many :shoes
  validates :brand, presence: true
end
