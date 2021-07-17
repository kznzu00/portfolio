class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(id: "DESC")
  end

  def statistics
    @posts = Post.all
    @maker_datas = {}
    Maker.all.each  do |maker|
      @maker_datas[maker.name] = @posts.where(maker_id: maker.id).count
    end

    @genre_datas = {}
    Genre.all.each  do |genre|
      @genre_datas[genre.name] = @posts.where(genre_id: genre.id).count
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id,:genre_id,:maker_id,:name,:image,:introduction)
  end

end
