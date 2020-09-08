class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def authenticate_user
    if @current_user == nil

      redirect_to new_session_path
    end
  end
  def check_user
    if current_user.id != @feed.user.id
      flash[:notice] = "権限がありません"
      redirect_to feeds_path
    end
  end
end
