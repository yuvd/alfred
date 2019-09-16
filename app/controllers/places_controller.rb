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
    # @bookmark = Bookmark.new
  end
end
