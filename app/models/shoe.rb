class Shoe < ApplicationRecord
  belongs_to :outfit
  has_many :feedbacks
  validates :generated_shoe, presence: true
  validates :brand, presence: true
end
