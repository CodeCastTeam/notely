class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Signed in'
    else
      redirect_to sign_in_path, alert: 'wrong credentials'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out'
  end
end
