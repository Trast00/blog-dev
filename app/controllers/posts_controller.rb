class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :author).where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(:comments, :author).find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(params_posts)
    @post.author = current_user

    respond_to do |format|
      if @post.save
        flash[:success] = 'Post saved successfully'
        format.html { redirect_to "/users/#{current_user.id}/posts/#{@post.id}" }
      else
        flash.now[:error] = 'Error: Post could not be saved'
        format.html { render :new }
      end
    end
  end

  private

  def params_posts
    params.require(:post).permit(:title, :text)
  end
end
