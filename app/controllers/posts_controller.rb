class PostsController < ApplicationController


  def index

  end

  def new
    
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


  private

    def post_params
      params.require(:posts).permit(:title, :body)
    end

end
