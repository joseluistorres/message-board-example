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
end
