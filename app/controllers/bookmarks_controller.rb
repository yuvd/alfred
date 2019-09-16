class BookmarksController < ApplicationController
  def index
    @bookmarks = policy_scope(@Restaurant)
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save!
    redirect_to '/'
  end

  def update
  end

  def edit
  end

  def delete
  end

  def bookmark_params
    params.require(:bookmarks).permit(:place, :user, :time)
  end
end
