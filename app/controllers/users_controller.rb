class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(posts_count: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_post
  end
end
