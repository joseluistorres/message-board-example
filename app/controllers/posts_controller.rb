class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = PostDecorator.decorate_collection(Post.eager_load(:user).order_by_latest)
  end

  def show
    @post = PostDecorator.decorate(@post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = PostService.new(post_params, current_user.id).call
    if @post.valid?
      @post = PostDecorator.decorate(@post)
      render 'show'
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      @post = PostDecorator.decorate(@post)
      render 'show'
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.includes(:comments).find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
