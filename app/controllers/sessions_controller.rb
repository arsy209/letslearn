class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
     if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to profile_path(current_user)
    else
      render "new"
      flash.now[:danger] = "There was something wrong with your login information"
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Successfully Logged Out'
  end
end
