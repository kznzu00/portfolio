class Admins::UsersController < ApplicationController
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
