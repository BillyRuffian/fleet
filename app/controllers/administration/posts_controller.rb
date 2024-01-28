class Administration::PostsController < ApplicationController

  layout 'administration'

  def index
  end

  def new
    @post = Post.new(published_at: Time.now)
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to administration_posts_url notice: "Thing was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published_at, :draft)
  end
end
