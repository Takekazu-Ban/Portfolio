class Admins::InquiriesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @inquiry = Inquiry.new
  end

  def create
    inquiry = Inquiry.new(inquiry_params)
    inquiry.user_id = current_user.id
    inquiry.save
    redirect_back(fallback_location: root_path)
  end
end
