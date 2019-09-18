class PlacesController < ApplicationController
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"
  API_KEY = ENV["YELP_API"]

  def index
    @categories = Category.includes(:preferences).where(preferences: { user: current_user })
    if params[:category]
      @places = Place.where(category: Category.find_by(name: params[:category]))
    else
      @places = Place.all
    end
    @places
  end

  def show
    @categories = Category.includes(:preferences).where(preferences: { user: current_user })
    @place = Place.find(params[:id])
    @reviews = @place.reviews.to_a
    @avg_rating = if @reviews.blank?
                    0
                  else
                    @place.reviews.average(:rating).floor
                  end
    # @bookmark = Bookmark.new
  end

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

