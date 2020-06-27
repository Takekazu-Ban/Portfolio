class Users::JoinsController < ApplicationController
  before_action :authenticate_user!
  def create
    join = current_user.circle_joins.build({circle_id: params[:circle_id]})
    join.user_id = current_user.id
    join.save
    redirect_to user_home_path(current_user.id)
  end

  def destroy
#     user_id = User.find(params[:id])
#     require 'net/http'

# response = Users::JoinsController::URL.get_response(URL)
# puts response.body
#     if user_id == current_user.id
    join = Join.find_by(circle_id: params[:circle_id], user_id: current_user.id)
    join.destroy
    redirect_to user_home_path(current_user.id)
    else
    end
  end

  def delete
    join = Join.find_by(circle_id: current_user.circle, user_id: 8)
    join.destroy
    redirect_to user_home_path(current_user.id)
  end
end
