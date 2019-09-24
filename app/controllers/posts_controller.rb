class PostsController < ApplicationController
  def new
    @forum = Forum.find(params[:forum_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.forum = Forum.find(params[:forum_id])
    @post.save!
    redirect_to forum_path(@post.forum, @post)
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    forum = @post.forum
    @post.destroy
    respond_to do |format|
      format.html { redirect_to forum_path(forum) }
      format.js
    end

  end

  def post_params
    params.require(:post).permit(:description)
  end

  def show
    @post = Post.find(params[:id])
    @forum = @post.forum
  end
end
