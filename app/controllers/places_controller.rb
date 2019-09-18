class PlacesController < ApplicationController

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
    @avg_rating = @reviews.blank? ? 0 : @place.reviews.average(:rating).floor
    @bookmark = Bookmark.new
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

