class Admins::CirclesController < ApplicationController
  def index
    @circles = Circle.all.page(params[:page]).per(5)
    @users = User.all
  end

  def show
    @circle = Circle.find(params[:id])
    @users = User.all
  end

  def destroy
    circle = Circle.find(params[:id])
    circle.destroy
    redirect_to admins_circles_path
  end

  private

  def circle_params
    params.require(:circle).permit(:profile_image, :genre, :active_area, :age_group, :circle_name, :circle_img, :explanation, :area_show, :recruitment, :cost, :count)
  end
end
