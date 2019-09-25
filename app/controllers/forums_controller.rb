class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find(params[:id])
    @posts = @forum.posts
    @place = @forum.place
  end

  def create
      place = Place.find(params[:place_id])
    unless place.forum.nil?
      redirect_to forum_path(place.forum)
    else
    @forum = Forum.create!(place: place)
    redirect_to forum_path(@forum)
    end
  end

end
