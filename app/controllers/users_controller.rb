class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @circle = Circle.all
    @new = Circle.all.order(created_at: :desc).limit(5)
    @popularity = Circle.find(Join.group(:circle_id).order('count(circle_id) desc').limit(5).pluck(:circle_id))
  end

  def show
    @user = User.find(params[:id])
    @circle = Circle.find(params[:id])
    #@join = @user.joined_circles.find(params[:join_id])
    if (controller_name != 'users' && action_name  != 'show') || (controller_name == 'host_circles')
      @circles = @user.circles.page(params[:page]).per(5)
      @circles_joined = @user.joined_circles.page(params[:page]).per(5)
    else
      @circles = @user.circles
      @circles_joined = @user.joined_circles
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "※全ての(必項)を埋めて下さい！"
      redirect_back(fallback_location: root_path)
    end
  end

  def leave
  end

  def delete
    user = User.find(current_user.id)
    user.destroy
    sign_out current_user
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :nickname, :gender, :age, :introduction, :email, :encrypted_password, :circle_img, :user_id)
  end
end
