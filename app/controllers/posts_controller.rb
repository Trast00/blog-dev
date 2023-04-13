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

  def new
    @post = Post.new
    @user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      flash[:success] = "Post saved successfully"
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}" #post_path(@post.id)
    else
      flash.now[:error] = "Error: Post could not be saved"
      render :new
    end
  end
end
