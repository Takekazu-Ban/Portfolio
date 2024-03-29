class Users::CirclesController < ApplicationController
  before_action :authenticate_user!
  def new
    @circle = Circle.new
  end

  def index
    # if(params[:newly] == 2)
    # @circles = Circle.all.search(params[:search]).order(created_at: :asc)
    # elsif(params[:newly] == 3)
    # @circles = Circle.find(Join.group(:circle_id).order('count(circle_id) asc').pluck(:circle_id))
    # elsif(params[:newly] == 4)
    # @circles = Circle.find(Join.group(:circle_id).order('count(circle_id) desc').pluck(:circle_id))
    # else
    # @circles = Circle.all.search(params[:search]).order(created_at: :desc)
    # end
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

    if params[:created_ats].present?
      @circles = @circles.get_by_created_at(params[:created_ats])
    end
    if params[:counts].present?
      @circles = @circles.get_by_count(params[:counts])
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
    @circle_user = Circle.find(params[:circle_id]).circle_joins
  end

  def join_room
    @circles = current_user.circles.page(params[:page]).per(4)
    @circles_joined = current_user.joined_circles.page(params[:page]).per(4)
    @circle = Circle.find(params[:circle_id])
    @message = HostCircle.new
    @messages = @circle.host_circles
    @circle_user = Circle.find(params[:circle_id]).circle_joins
  end

  def edit
    @circle = Circle.find(params[:id])
  end

  def create
    circle = Circle.new(circle_params)
    circle.user_id = current_user.id
    if circle.save
      redirect_to user_home_path(current_user.id)
    else
      flash[:alert] = "※全ての(必項)を埋めて下さい！"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    circle = Circle.find(params[:id])
    if circle.update(circle_params)
      redirect_to user_home_path(current_user.id)
    else
      flash[:alert] = "※全ての(必項)を埋めて下さい！"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def circle_params
    params.require(:circle).permit(:genre, :active_area, :age_group, :circle_name, :circle_img, :explanation, :area_show, :recruitment, :cost, :count, :circle_joins)
  end
end
