class CommentsController < ApplicationController
  def create
    comment = Comment.create(params.require(:comment).permit(:text).merge(user_id:current_user.id,post_id:params[:post_id]))
    redirect_to post_path(params[:post_id])
  end

end
