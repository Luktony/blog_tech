
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    # Retrieves all the posts and assigns them to the instance variable @posts.
  def index
    @posts = Post.all
  end
  def show  
  end

def new
    @post = Post.new
  end
  def create
    @post= Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
    
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def destroy
    @post.destroy
    redirect_to root_path
    
  end
 private
  def post_params
    params.require(:post).permit(:title, :body)
  end

def set_post
  @post = Post.find(params[:id])
  
end

end



