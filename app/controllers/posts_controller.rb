class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :author).where(author_id: params[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
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

  def destroy
    post = Post.find(params[:id])
    Post.find(params[:id]).comments.destroy_all
    Post.find(params[:id]).likes.destroy_all
    respond_to do |format|
      if post.destroy
        # Successfully deleted the record
        flash[:success] = 'Post deleted successfully'
        format.html { redirect_to "/users/#{current_user.id}/posts" }
      else
        # Failed to delete the record
        flash.now[:error] = 'Error: Post could not be deleted'
        format.html { render :show }
      end
    end
  end

  private

  def params_posts
    params.require(:post).permit(:title, :text)
  end
end
