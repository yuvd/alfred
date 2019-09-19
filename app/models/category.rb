class Category < ApplicationRecord
  
  has_many :places
  has_many :preferences
  validates :name, uniqueness: true
end
