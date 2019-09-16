class PlacesController < ApplicationController

  def map
    @places = Place.geocoded
    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end
end
