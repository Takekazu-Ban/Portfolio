class Users::InquiriesController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @inquiry = Inquiry.new
    @inquiries = Inquiry.all
  end

  def create
    inquiry = Inquiry.new(inquiry_params)
    inquiry.user_id = current_user.id
    inquiry.save
    redirect_back(fallback_location: root_path)
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:user_id, :admin_id, :title, :question)
  end
end
