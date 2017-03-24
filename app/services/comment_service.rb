##
# This service class will hold the comment creation action
# and any other related business rule related to it
#
#
class CommentService

  def initialize(post_id, comment_params)
    @post_id = post_id
    @comment_params = comment_params
  end

  def call
    Comment.create(@comment_params.merge!({post_id: @post_id}))
  end
end