class UsersController < ApplicationController
  # this is needed to display the form for the user to sign up
  def new
    # when we have an instance variable (starts with @)
    # the variable is accessible in the view file
    @user = User.new
  end

  # this is needed to handle the form submission to create the user
  def create
    user_params = params.require(:user).permit([:first_name, :last_name, :email, :password])
    @user = User.new(user_params)
    if @user.save # .save will return `true` if no validation errors are there
      session[:user_id] = @user.id # we sign the user in by storing their ID in the session
      redirect_to root_path
    else
      render :new # show the form again for the user to correct errors
    end
  end
end
