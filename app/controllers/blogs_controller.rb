class BlogsController < ApplicationController
  include Pagy::Backend
  layout 'landing'

  def show
    @blog = Blog.first
    # @pagy, @posts = pagy(Post.order(published_at: :desc))
    @posts = Post.order(published_at: :desc)
  end
end
