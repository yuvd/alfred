class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: current_user, time: nil)
    @bookmarks_list = []
    @bookmarks.each do |bm|
      @bookmarks_list << bm unless bookmarks_list.include?(bm)
    end
    @bookmarks_schedule = current_user.bookmarks.select{ |bm| !bm.time.nil? }
    #@bookmarks = policy_scope(Bookmark)
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
    if params['list'] == 'true'
      redirect_to place_bookmarks_path(params[:place_id]), method: :post
    end
  end

  def create
    @bookmark = Bookmark.new()
    @bookmark.user = current_user
    @bookmark.place = Place.find(params[:place_id])
    binding.pry

    @bookmark.time = params[:bookmark][:time].to_datetime
    @bookmark.save!
    redirect_to bookmarks_path
  end

  def update
  end

  def edit
  end

  def delete
  end

  # def bookmark_params
  #   params.require(:bookmark).permit(:time)
  # end
end
