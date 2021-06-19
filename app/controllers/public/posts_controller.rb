class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @newpost = Post.new
  end

  def create
    @newpost = Post.new(post_params)
    @newpost.user_id = current_user.id
    pp @newpost
    @newpost.save
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:user_id,:genre_id,:maker_id,:name,:image,:introduction)
  end

end
