class PlacesController < ApplicationController
  
  def index
    Businesses.get_businesses
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
end

