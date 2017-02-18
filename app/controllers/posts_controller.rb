class PostsController < ApplicationController
  def new
    @post = Post.new
    @sub = Sub.find_by(id: params[:sub_id])
  end

  def create
    @post = Post.create(posts_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :create
    end
  end

  def destroy
    @post = current_post
    if @post
      @post.destroy
      redirect_to sub_url(@post.sub)
    else
      flash[:errors] = ["Could not find post"]
    end
  end

  def show
    @post = current_post
    if @post
      render :show
    else
      flash[:errors] = ["Could not find post"]
      redirect_to posts_url
    end
  end

  def index
    @posts = Post.all
  end

  def update
    @post = current_post
    if @post
      @post.update_attributes(posts_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = ["Could not find post"]
      redirect_to posts_url
    end
  end

  def edit
    @post = current_post
  end

  private

  def posts_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
  end

  def current_post
    Post.find_by(id: params[:id])
  end
end
