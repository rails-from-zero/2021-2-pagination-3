class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page])
  end
end
