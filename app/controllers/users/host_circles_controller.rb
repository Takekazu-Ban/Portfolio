class Users::HostCirclesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @circles = @user.circles.page(params[:page]).per(4)
    @circles_joined = current_user.joined_circles.page(params[:page]).per(4)
  end

  def joining_show
    @circles_joined = current_user.joined_circles.page(params[:page]).per(4)
  end

  def create
    @circles = current_user.circles
    message = HostCircle.new(host_circle_params)
    message.user_id = current_user.id
    message.save
    redirect_back(fallback_location: root_path)
  end

  private
  def host_circle_params
    params.require(:host_circle).permit(:message, :circle_id)
  end
end
