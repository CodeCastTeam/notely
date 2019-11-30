class ApplicationController < ActionController::Base
  def user_sign_in?
    session[:user_id].present?
  end
  helper_method :user_sign_in? 

  def current_user
    User.find(session[:user_id])
  end
  helper_method :current_user
end
