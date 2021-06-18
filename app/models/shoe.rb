class Shoe < ApplicationRecord
  belongs_to :outfit, touch: true
  has_many :shoe_categories, dependent: :destroy
  has_one_attached :photo
  has_many :categories, through: :shoe_categories
  accepts_nested_attributes_for :categories, allow_destroy: true
  has_many :wishes, dependent: :destroy


  #shoes are voted on by user:
  acts_as_votable

end
