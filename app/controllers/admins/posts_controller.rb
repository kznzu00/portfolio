class Admins::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
  end
end
