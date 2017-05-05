require 'rails_helper'

RSpec.describe PostsController, type: :controller do
 describe "GET index" do
    it "assigns @posts" do
      user = FactoryGirl.create(:user)
      post1 = FactoryGirl.create(:post, user: user)
      post2 = FactoryGirl.create(:post, title: "Circle of Life", body: "This is just a text",user: user)
      arr_posts = PostDecorator.decorate_collection([post2, post1])
      get :index
      expect(assigns(:posts)[0].id).to eq(arr_posts[0].id)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Create a new Post" do
    it "responds to html with the show template by default" do
      user = FactoryGirl.create(:user)
      user.confirm
      sign_in(user)
      post :create, { post: { title: "Circle of Life", body: "This is just a text" } }
      expect(response.content_type).to eq "text/html"
      expect(response).to render_template("show")
    end
  end

  describe "User shouldn't be able to Create a new Post unless is logged in" do
    it "not hitting the new action in posts controller" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "not hitting the create action in posts controller" do
      post :create, { post: { title: "Circle of Life", body: "This is just a text" } }
      expect(response).to redirect_to new_user_session_path
    end

    it "not hitting the update action in posts controller" do
      put :update, id: 1, post: { title: "Circle of Life", body: "This is just a text" }
      expect(response).to redirect_to new_user_session_path
    end
  end
end
