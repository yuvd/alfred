class PlacesController < ApplicationController

  def index
    @pictures = [ 'city-lights.png', 'night2.jpeg', 'light-city.jpeg', 'cityy.jpeg', 'red-city.jpeg']
    @categories = []
    @categories << Category.includes(:preferences).where(preferences: { user: current_user })
    @categories.flatten!

    if params[:category] && params[:category] != "all"
      unless Place.where({city: (current_user.location.split(",")[0]), category: Category.find_by(name:params[:category])}).empty?
        @places = Place.where({city: (current_user.location.split(",")[0]), category: Category.find_by(name:params[:category])}).to_a
      else

        businesses = Businesses.get_businesses(params[:category], (current_user.location.split(",")[0]))
        businesses.each do |business|
          if Place.find_by(name: business["name"]).blank?
            unless 
              unless business["location"]["address1"].blank?
                Place.create!(name: business["name"], location: business["location"]["address1"], longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: (current_user.location.split(",")[0]), category: Category.find_by(name: params[:category]))
              else
                Place.create!(name: business["name"], location: "#{(current_user.location.split(",")[0])} Area", longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: (current_user.location.split(",")[0]), category: Category.find_by(name: params[:category]))
              end
            end
          end
        end
        @places = Place.where(category: Category.find_by(name: params[:category]), city: (current_user.location.split(",")[0]))

        populate_places_with_businesses(params[:category])
        @places = Place.where(category: Category.find_by(name: params[:category]), city: (current_user.location.split(",")[0])).to_a

      end
    else
      @places = []
      @categories.each do |category|
        unless Place.where(category: category, city: (current_user.location.split(",")[0])).empty?
          @places << Place.where(category: category, city: (current_user.location.split(",")[0])).to_a
        else
          populate_places_with_businesses(category.name)
          @places << Place.where(category: category, city: (current_user.location.split(",")[0])).to_a
        end
      end
      @places.flatten!
    end

    @bookmark = Bookmark.new


    # @place = Place.find(params[:id])
    # @reviews = @place.reviews.to_a
    # @avg_rating = @reviews.blank? ? 0 : @place.reviews.average(:rating).floor
    @categories.unshift(Category.find_by(name: "all"))
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
      businesses = Businesses.get_businesses(category, (current_user.location.split(",")[0]))
      businesses.each do |business|
        if Place.find_by(name: business["name"]).blank?
          unless business["location"]["address1"].blank?
            Place.create!(name: business["name"], location: business["location"]["address1"], photo: business["image_url"], longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: (current_user.location.split(",")[0]), category: Category.find_by(name: category))
          else
            Place.create!(name: business["name"], location: "#{(current_user.location.split(",")[0])} Area", photo: business["image_url"], longitude: business["coordinates"]["longitude"], latitude: business["coordinates"]["latitude"], city: current_user.location, category: Category.find_by(name: category))
          end
        end
      end
    end
end
