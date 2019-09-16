class Place < ApplicationRecord
  belongs_to :category
  has_many :bookmarks

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :location, presence: true

end
