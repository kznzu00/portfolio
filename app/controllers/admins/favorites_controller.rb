class Admins::FavoritesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post = Post.find(params[:post_id])
    @favorites = Favorite.where(post_id: @post.id )
  end

end
