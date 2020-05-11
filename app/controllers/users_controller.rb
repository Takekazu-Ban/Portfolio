class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update, :delete]

  def home
  end

  def show
    @user = User.find(params[:id])
    #@circles = Circle.all.page(params[:page]).per(5)
    @circles = @user.circles.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def leave
  end

  def delete
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    sign_out current_user
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :nickname, :gender, :age, :introduction, :email, :encrypted_password, :circle_img)
  end
end
