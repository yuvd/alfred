class Place < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy

  has_many :bookmarks, dependent: :destroy

  has_one :forum

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :location, presence: true

  monetize :price_cents

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


end
