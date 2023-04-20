class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def new
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def create
    before_action :authenticate_user!
    @user = current_user
    @post = Post.find(params[:post_id])
    comment = Comment.new(params_comments)
    comment.author = @user
    comment.post = @post

    respond_to do |format|
      if comment.save
        flash[:success] = 'Comment saved successfully'
        format.html { redirect_to "/users/#{@user.id}/posts/#{@post.id}" }
        format.json { render json: comment, status: :created }
      else
        flash.now[:error] = 'Error: Comment could not be saved'
        format.html { render :new }
        format.json { render json: { error: 'Error: Comment could not be saved' }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    respond_to do |format|
      if comment.destroy
        # Successfully deleted the record
        flash[:success] = 'Comment deleted successfully'
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
