class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_admin.posts.new
  end

  def create
    @post = current_admin.posts.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end


  def edit
  end


  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to @post
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end


  def show
  end


  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = current_admin.posts.find(params[:id])
  end
end
