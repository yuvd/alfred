class PostRepliesController < ApplicationController
  def new
    @post_reply = PostReply.new
    @forum = Post.find(params[:post_id]).forum
  end

  def create
    @post_reply = PostReply.new(post_reply_params)
    @post_reply.user = current_user
    @post_reply.post =  post = Post.find(params[:post_id])
    @post_reply.save!
    redirect_to forum_post_path(post.forum, post)
  end

  def destroy

    @post_reply = PostReply.find(params[:id])
    @post = @post_reply.post
    @forum = @post.forum
    @post_reply.destroy

    redirect_to forum_post_path(@forum, @post)
  end

  def post_reply_params
    params.require(:post_reply).permit(:description)
  end
end
