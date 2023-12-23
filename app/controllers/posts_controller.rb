class PostsController < ApplicationController

  def show
    slug = params[:slug]
    @blog = Blog.first
    @post = Post.find_by(slug:)
  end
end
