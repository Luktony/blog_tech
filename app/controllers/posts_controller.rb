
class PostsController < ApplicationController
    # Retrieves all the posts and assigns them to the instance variable @posts.
  def index
    @posts = Post.all
  end
end
