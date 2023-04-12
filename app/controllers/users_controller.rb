class UsersController < ApplicationController
  def index
    @users = User.all.order(posts_count: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.order(id: :asc)
  end
end
