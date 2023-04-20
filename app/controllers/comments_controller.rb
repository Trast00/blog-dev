class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    comment = Comment.new(params_comments)
    comment.author = @user
    comment.post = @post

    respond_to do |format|
      if comment.save
        flash[:success] = 'Comment saved successfully'
        format.html { redirect_to "/users/#{@user.id}/posts/#{@post.id}" }
      else
        flash.now[:error] = 'Error: Comment could not be saved'
        format.html { render :new }
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    respond_to do |format|    
      if comment.destroy
        # Successfully deleted the record
        flash[:success] = "Comment deleted successfully"
      else
        # Failed to delete the record
        flash.now[:error] = 'Error: Comment could not be deleted'
      end
      format.html { redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}" }
    end
  end

  private

  def params_comments
    params.require(:comment).permit(:text)
  end
end
