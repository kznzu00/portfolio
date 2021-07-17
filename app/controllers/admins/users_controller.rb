class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order

  end

  def statistics
    @user = User.find(params[:id])
    @posts = @user.posts
    @maker_datas = {}
    Maker.all.each  do |maker|
      @maker_datas[maker.name] = @user.posts.where(maker_id: maker.id).count
    end

    @genre_datas = {}
    Genre.all.each  do |genre|
      @genre_datas[genre.name] = @user.posts.where(genre_id: genre.id).count
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user =User.find(params[:id])
    user.update(user_params)
    redirect_to admins_user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:full_name,:full_name_kana, :nickname, :email, :icon_id, :introduction, :is_active)

  end
end
