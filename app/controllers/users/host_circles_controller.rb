class Users::HostCirclesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @circles = @user.circles.page(params[:page]).per(5)
    @circles_joined = current_user.joined_circles.page(params[:page]).per(5)
  end

  def joining_show
    @circles_joined = current_user.joined_circles.page(params[:page]).per(5)
  end

  def create
    @circles = current_user.circles
    message = HostCircle.new(host_circle_params)
    message.user_id = current_user.id
    message.save
    #redirect_to users_host_circle_path(current_user.id)
    redirect_to users_circle_host_room_path(current_user.circles.ids)
  end

  private
  def host_circle_params
    params.require(:host_circle).permit(:message, :circle_id)
  end
end
