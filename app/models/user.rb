class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, length: { minimum: 2, maximum: 10 }
  has_many :outfits
  has_many :feedbacks
  has_many :wishes
  has_one_attached :avatar

  acts_as_voter
end
