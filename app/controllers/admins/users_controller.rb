class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:full_name,:full_name_kana, :nickname, :email, :icon_id, :introduction)

  end
end
