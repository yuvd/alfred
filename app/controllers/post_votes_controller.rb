class PostVotesController < ApplicationController
  def create
    @postvote = PostVote.create!(user: current_user, post: Post.find(params[:post_id]))
    @post = @postvote.post
    respond_to do |format|
      format.html { redirect_to place_forum_path(Post.find(params[:post_id]).forum) }
      format.js
    end
  end

  def destroy
    @postvote = PostVote.find(params[:id])
    @post = @postvote.post
    @postvote.destroy
    respond_to do |format|
      format.html { redirect_to place_forum_path(Post.find(params[:post_id]).forum) }
      format.js
    end
  end
end
