class Admins::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(4)
  end

  def show
    @user = User.find(params[:id])
    @circles = @user.circles.page(params[:page]).per(5)
    @circles_joined = @user.joined_circles.page(params[:page]).per(5)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_users_path
  end

  private
  def user_params
    params.require(:user).permit(:profile_image_id, :nickname, :age, :email, :user_id)
  end
end
