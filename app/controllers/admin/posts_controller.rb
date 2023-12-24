class Admin::PostsController < ApplicationController
  before_action :require_login
  before_action :find_post, except: [:new, :index, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_post_url(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to admin_post_url(@post)
    else
      render :edit, status: :unprocessable_entity
    end
        
  end

  def index
    @posts = Post.order(published_at: :desc).all
  end

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
