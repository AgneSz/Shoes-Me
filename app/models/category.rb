class Category < ApplicationRecord
  has_many :outfit_categories
  has_many :shoe_categories
end
