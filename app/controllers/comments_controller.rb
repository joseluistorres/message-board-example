class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment_service = CommentService.new(@post.id, comments_params.merge!(user_id: current_user.id))
    comment = comment_service.call
    if comment.valid?
      redirect_to @post
    else
      render @post
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.required(:comment).permit(:body)
  end
end
