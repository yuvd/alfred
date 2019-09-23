class PostVotesController < ApplicationController
  def create
    @postvote = PostVote.create!(user: current_user, post: Post.find(params[:post_id]))
    respond_to do |format|
      format.html { redirect_to place_forum_path(Post.find(params[:post_id]).forum) }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @postvote = @post.post_votes.where(user: current_user).first
    @postvote.destroy
    respond_to do |format|
      format.html { redirect_to place_forum_path(Post.find(params[:post_id]).forum) }
      format.js
    end
  end
end
