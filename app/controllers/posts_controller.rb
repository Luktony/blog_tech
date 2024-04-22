
class PostsController < ApplicationController
  include Paginable
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    # Retrieves all the posts and assigns them to the instance variable @posts.
  def index
    tag=Tag.find_by_name(params[:tag]) if params[:tag].present?
    @posts = Post.filter_by_tags(tag).order(created_at: :desc).page(current_page).per(3)
    @tags = Tag.sorted
  
  end
  def show  
  end

def new
    @post = current_user.posts.new
  end
  def create
    @post= current_user.posts.new(post_params)

    if @post.save
      redirect_to @post,notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to @post,notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def destroy
    @post.destroy
    redirect_to root_path,notice: "Post was successfully destroyed."
    
  end
 private
  def post_params
    params.require(:post).permit(:title, :body, :tag_id)
  end

def set_post
  @post = Post.find(params[:id])
  authorize @post
  
end

end



