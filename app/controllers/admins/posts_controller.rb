class Admins::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(id: "DESC")
  end
end
