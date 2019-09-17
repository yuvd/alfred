class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    #@bookmarks = policy_scope(Bookmark)
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.place = Place.find(params[:place_id])
    @bookmark.save!
    redirect_to user_bookmark_path(current_user, @bookmark)
  end

  def update
  end

  def edit
  end

  def delete
  end

  def bookmark_params
    params.require(:bookmark).permit(:place, :user, :time)
  end
end
