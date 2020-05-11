class Users::CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def index
    age_group_ids = Circle.where("age_group = ?", params[:age_group]).pluck(:id)
     @circles = Circle.all.page(params[:page]).search(params[:search])
  end

  def show
    @circle = Circle.find(params[:id])
    #@user = User.find(params[:id])
  end

  def edit
    @circle = Circle.find(params[:id])
  end

  def create
    @circle = current_user.circles.build(circle_params)
    @circle.save
    redirect_to user_home_path(current_user.id)
  end

  def update
    circle = Circle.find(params[:id])
    circle.update(circle_params)
    redirect_to user_home_path(current_user.id)
  end

  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def circle_params
    params.require(:circle).permit(:genre, :active_area, :age_group, :circle_name, :circle_img, :explanation, :area_show, :recruitment, :cost, :count)
  end
end
