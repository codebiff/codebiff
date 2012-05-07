class PostsController < ApplicationController
  
  caches_page :index, :show, :slug, :tag
  
  before_filter :authenticate, :only => [:edit, :new, :destroy]
  
  def index
    @posts = Post.text_search(params[:q])
    @posts = @posts.published unless session[:admin]
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def slug
    @post = Post.find_by_slug(params[:slug])
    if @post.nil?
      render "error_pages/404"
    else
      render :show
    end
  end
  
  def tag
    @posts = Post.tagged_with(params[:tag])
    @posts = @posts.published unless session[:admin]
    render :index
  end
  
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
 
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render action: "new" 
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end
  
end
