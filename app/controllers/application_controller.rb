class ApplicationController < ActionController::Base
  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in? 

  def current_user
    User.find(session[:user_id])
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end
end
