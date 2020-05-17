class Users::JoinsController < ApplicationController
  def index
    @circles_joined = current_user.joined_circles.page(params[:page]).per(5)
  end

  def show
    #@circles_joined = Join.find(params[:id]) 
  end

  def create
    join = current_user.circle_joins.build({circle_id: params[:circle_id]})
    join.user_id = current_user.id
    join.save
    redirect_to user_home_path(current_user.id)
  end

  def destroy
    join = Join.find_by(circle_id: params[:circle_id], user_id: current_user.id)
    join.destroy
    redirect_to user_home_path(current_user.id)
  end
end
