class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show]
  before_action :set_user_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.create(post_params)

    if @post.save
      redirect_to post_path(@post), notice: "Post successfully created"
    else
      render :new, post: @post
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post successfully updated"
    else
      render :edit, post: @post
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post successfully deleted"
    else
      redirect_to posts_path, notice: "Unable to delete post"
    end
  end

  def show
  end

  private

  def set_user_post
    @post = @current_user.posts.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
