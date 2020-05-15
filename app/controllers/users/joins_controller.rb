class Users::JoinsController < ApplicationController
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
