class UsersController < ApplicationController
  def index
    @users = User.all.order(posts_count: :desc)
  end

  def show; end
end
