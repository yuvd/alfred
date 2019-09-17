class Category < ApplicationRecord
  
  has_many :places
  has_many :preferences
end
