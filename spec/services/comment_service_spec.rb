require 'rails_helper'

describe CommentService do
  let(:user){ FactoryGirl.create(:user) }
  subject(:post_service) { PostService.new({ title: 'This is a title', body: "something"}, user.id) }
  #subject(:comment_service) { CommentService.new(post_service.call, { body: 'I like this post a lot', user_id: user.id }) }

  describe "Comment operations" do

    context "New Comment Creation" do

      it "should succeed on comment creation" do
        post = post_service.call
        comment_service = CommentService.new(post.id, { body: 'I like this post a lot', user_id: post.user.id })
        comment = comment_service.call
        expect(comment.valid?).to be true
      end
      
    end
  end

end
