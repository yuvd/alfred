class PlacesController < ApplicationController
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"
  API_KEY = ENV["YELP_API"]


  def map
    @places = Place.geocoded
    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end



  def get_businesses(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location
    }
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    @places = response.parse["businesses"]
  end
end