class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to home_path
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
