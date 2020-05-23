class Users::CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def index
      @circles = Circle.all.search(params[:search])
        if params[:genres].present?
          @circles = @circles.get_by_genre(params[:genres])
        end
        if params[:active_areas].present?
          @circles = @circles.get_by_active_area(params[:active_areas])
        end
        if params[:age_groups].present?
          @circles = @circles.get_by_age_group(params[:age_groups])
        end
  end

  def show
    @circle = Circle.find(params[:id])
  end

  def host_room
    @circles = current_user.circles.page(params[:page]).per(4)
    @circles_joined = current_user.joined_circles.page(params[:page]).per(4)
    @circle = Circle.find(params[:circle_id])
    @message = HostCircle.new
    @messages = @circle.host_circles
  end

  def join_room
    @circles = current_user.circles.page(params[:page]).per(4)
    @circles_joined = current_user.joined_circles.page(params[:page]).per(4)
    @circle = Circle.find(params[:circle_id])
    @message = HostCircle.new
    @messages = @circle.host_circles
  end

  def edit
    @circle = Circle.find(params[:id])
  end

  def create
    circle = current_user.circles.create!(circle_params)
    circle.save
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
    params.require(:circle).permit(:genre, :active_area, :age_group, :circle_name, :circle_img, :explanation, :area_show, :recruitment, :cost, :count, :join_user)
  end
end
