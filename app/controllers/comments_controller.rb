class CommentsController < ApplicationController
  def create
    post.comments.create!(comment_params)

    redirect_to post
  end

  private

  def post
    Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
