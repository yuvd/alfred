class PostVotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @postvote = PostVote.create!(user: current_user, post: @post)
    respond_to do |format|
      format.html { redirect_to place_forum_path(@post.forum) }
      format.js
    end
  end

  def destroy
    @postvote = PostVote.find(params[:id])
    @post = @postvote.post
    @postvote.destroy
    respond_to do |format|
      format.html { redirect_to place_forum_path(@post.forum) }
      format.js
    end
  end
end
