class Users::HostCirclesController < ApplicationController
  def show
    @message = HostCircle.new
    @messages = HostCircle.all
    @user = User.find(params[:id])
    @circles = @user.circles.page(params[:page]).per(5)
  end

  def create
    message = HostCircle.new(host_circle_params)
    message.user_id = current_user.id
    message.save
    redirect_to users_host_circle_path(current_user.id)
  end

  private
  def host_circle_params
    params.require(:host_circle).permit(:message)
  end
end
