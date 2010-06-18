class PostsController < ApplicationController
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
end

