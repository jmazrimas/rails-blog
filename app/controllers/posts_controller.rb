class PostsController < ApplicationController


  def index

    @posts = Post.all.order("created_at DESC")

  end

  def new
    @post = Post.new
  end

  def create
    puts params
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    render :edit
  end


  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
