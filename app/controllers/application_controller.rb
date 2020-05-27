class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログイン時の画面設定
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_home_path(current_user.id)
    when Admin
      admin_home_path(resource)
    end
  end

  # ログアウト時の画面設定
  def after_sign_out_path_for(resource)
    if resource == :admin
      top_admin_path(resource)
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image, :nickname, :gender, :age])
  end
end
