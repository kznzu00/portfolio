class Public::UsersController < ApplicationController
  def my_page
    @user = current_user
    @current_user_posts = Post.where(user_id: current_user.id)
    @posts = @current_user_posts.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
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
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: '退会')
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name,:full_name_kana, :nickname, :email, :icon, :introduction)

  end
end
