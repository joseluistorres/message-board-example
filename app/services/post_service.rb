##
# This service class will hold the post creation action
# and any other related business rule related to it
#
#
class PostService

  def initialize(post_params, user_id)
    @post_params = post_params
    @user_id = user_id
  end

  def call
    Post.create(@post_params.merge!(user_id: @user_id))
  end
end