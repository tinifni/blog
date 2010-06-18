class PostsController < ApplicationController
  before_filter :check_published, :only => [:show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Created"
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end

  def index
    @posts = Post.find(:all, :conditions => { :published => true } )
  end

  def show
  end

  private

  def check_published
    @post = Post.find(params[:id])
    unless @post.published?
      flash[:error] = "Not published yet"
      redirect_to posts_path
    end
  end
end
