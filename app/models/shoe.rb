class Shoe < ApplicationRecord
  belongs_to :outfit
  has_many :feedbacks
  has_many :shoe_categories, dependent: :destroy
  has_many_attached :photos
  has_many :categories, through: :shoe_categories
  accepts_nested_attributes_for :categories, allow_destroy: true


  #shoes are voted on by user:
  acts_as_votable
end
