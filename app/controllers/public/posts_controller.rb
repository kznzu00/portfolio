class Public::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).reverse_order
    @newpost = Post.new
    @favorites_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
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
    @comments = Comment.where(post_id: @post.id).order(id: "DESC")
  end

  def delete
    @post = Post.find(params[:id])
    @post = Post.destroy
    redirect_to user_my_page_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id,:genre_id,:maker_id,:name,:image,:introduction)
  end

end
