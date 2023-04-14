class CommentsController < ApplicationController

  def new
    @user = current_user
    @post = Post.find(params[:id_post])
  end

  def create
    @user = current_user
    @post = Post.find(params[:id_post])
    comment = Comment.new(params_comments)
    comment.author = @user
    comment.post = @post

    respond_to do |format|
      if comment.save
        flash[:success] = 'Post saved successfully'
      else
        flash.now[:error] = 'Error: Post could not be saved'
      end
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    end
  end

  private
  
  def params_comments
    params.require(:comment).permit(:text)
  end
end