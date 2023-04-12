class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id_post])
    @comments = Comment.where(post_id: @post.id)
  end
end
