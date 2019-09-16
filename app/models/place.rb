class Place < ApplicationRecord
  belongs_to :category
  monetize :price_cents

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
