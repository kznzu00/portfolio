class Public::UsersController < ApplicationController
  def my_page
    @user = current_user
  end

  def show
    @user =User.find(params[:id])
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    user =User.find(params[:id])
    user.update(user_params)
    redirect_to user_my_page_path(current_user.id)
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:full_name,:full_name_kana, :nickname, :email, :icon_id, :introduction)

  end
end
