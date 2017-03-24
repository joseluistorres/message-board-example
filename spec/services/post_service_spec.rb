require 'rails_helper'

describe PostService do
  let(:user){ FactoryGirl.create(:user) }
  subject(:post_service) { PostService.new({ title: 'This is a title', body: "something"}, user.id) }
  subject(:post_service_failed) { PostService.new({ title: 'This is a title', body: nil}, user.id) }

  describe "Post operations" do

    context "New Post Creation" do
      it "creates a valid post" do
        expect(post_service.call.valid?).to be true
      end

      it "should fail post creation" do
        expect(post_service_failed.call.valid?).to be false
      end
      
    end
  end

end
