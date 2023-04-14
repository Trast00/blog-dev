class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    like = Like.new(author: @user, post: @post)

    respond_to do |format|
      if like.save
        flash[:success] = 'Liked'
      else
        flash.now[:error] = 'Error While Like'
      end
      format.html { redirect_to "/users/#{@user.id}/posts/#{@post.id}" }
    end
  end
end
