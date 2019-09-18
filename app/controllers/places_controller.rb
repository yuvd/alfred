class PlacesController < ApplicationController

  def index
    @categories = Category.includes(:preferences).where(preferences: { user: current_user })
    if params[:category]
      unless Place.where({city: current_user.city, category: Category.find_by(name:params[:category])}).empty?
        @places = Place.where({city: current_user.city, category: Category.find_by(name:params[:category])})
      else
        businesses = Businesses.get_businesses(params[:category], current_user.city) 
        businesses.each do |business|
          if Place.find_by(name: business["name"]).nil?
            unless business["location"]["address1"].nil?
              Place.create!(name: business["name"], location: business["location"]["address1"], longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: current_user.city, category: Category.find_by(name: params[:category]))
            else
              Place.create!(name: business["name"], location: "", longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: current_user.city, category: Category.find_by(name: params[:category]))
            end
          end
        end
        @places = Place.where(category: Category.find_by(name: params[:category]), city: current_user.city)
      end
    else
      @places = Place.all
    end
    # @places
  end

  def show
    #@bookmark = Bookmark.new
    @categories = Category.includes(:preferences).where(preferences: { user: current_user })
    @place = Place.find(params[:id])
    @reviews = @place.reviews.to_a
#     @avg_rating = if @reviews.blank?
#                     0
#                   else
#                     @place.reviews.average(:rating).floor
#                   end

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

