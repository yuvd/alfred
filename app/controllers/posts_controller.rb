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
    redirect_to forum_post_path(@post.forum, @post)
  end

  def edit
  end

  def update
  end

  def delete
  end

  def post_params
    params.require(:post).permit(:description)
  end

  def show
    @post = Post.find(params[:id])
  end
end
