require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
 describe "Create comment action" do
    it "should redirect to post show page" do
      user = FactoryGirl.create(:user)
      post1 = FactoryGirl.create(:post, user: user)
      user.confirm
      sign_in(user)
      post :create, { comment: { body: "That's a cool post" }, post_id: post1.id }
      expect(response).to redirect_to(assigns(:post))
    end
  end
end
