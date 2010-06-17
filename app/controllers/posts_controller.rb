class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:sucess] = "Congrats!"
      redirect_to posts_path
    else
      render 'new'
    end
  end
  def index
    @posts = Post.all
  end
end

