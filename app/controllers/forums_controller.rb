class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Place.find(params[:id]).forum
    @posts = @forum.posts
  end

  def create
    redirect_to place_forum_path(params[:place_id]) if Forum.exists?(Place.find(params[:place_id]).forum)

    @forum = Forum.create!(place: params[:place_id])
    redirect_to place_forum_path(params[:place_id])
  end

end
