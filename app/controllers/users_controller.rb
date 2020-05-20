class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @circle = Circle.all
    @circles = Circle.all.order(created_at: :desc).limit(5)#.page(params[:page]).per(2)
    @circles1 = Circle.find(Join.group(:circle_id).order('count(circle_id) desc').limit(5).pluck(:circle_id))
  end

  def show
    @user = User.find(params[:id])
    @circles = @user.circles.page(params[:page]).per(5)
    @circles_joined = current_user.joined_circles.page(params[:page]).per(5)
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
