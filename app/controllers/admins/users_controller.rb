class Admins::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admins_users_path
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :nickname, :age, :email, :gender)
  end
end
