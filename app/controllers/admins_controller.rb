class AdminsController < ApplicationController
  def home
    @inquiries = Inquiry.all
  end

  def top
  end
end
