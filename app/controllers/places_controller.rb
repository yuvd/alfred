class PlacesController < ApplicationController
  
  def index
    @categories = Category.includes(:preferences).where(preferences: { user: current_user })
    if params[:category]
      unless Place.where({city: current_user.location, category: Category.find_by(name:params[:category])}).empty?
        @places = Place.where({city: current_user.location, category: Category.find_by(name:params[:category])}).to_a
      else
        populate_places_with_businesses(params[:category])
        @places = Place.where(category: Category.find_by(name: params[:category]), city: current_user.location).to_a
      end
    else
      @places = []
      @categories.each do |category|
        unless Place.where(category: category, city: current_user.location).empty? 
          @places << Place.where(category: category, city: current_user.location).to_a
        else
          populate_places_with_businesses(category.name)
          @places << Place.where(category: category, city: current_user.location).to_a
        end
      end
      @places.flatten!
    end
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
    
    def populate_places_with_businesses(category)
      businesses = Businesses.get_businesses(category, current_user.location) 
      businesses.each do |business|
        if Place.find_by(name: business["name"]).nil?
          unless business["location"]["address1"].nil?
            Place.create!(name: business["name"], location: business["location"]["address1"], photo: business["image_url"], longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: current_user.location, category: Category.find_by(name: category))
          else
            Place.create!(name: business["name"], location: "#{current_user.location} Area", photo: business["image_url"], longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: current_user.location, category: Category.find_by(name: category))
          end
        end
      end
    end
end