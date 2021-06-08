class Outfit < ApplicationRecord
  belongs_to :user
  has_many :shoes, dependent: :destroy
  validates :brand, presence: true
end
