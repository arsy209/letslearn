class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path if logged_in?
    else
      flash.now[:danger] = "There was something wrong with your login information"
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Successfully Logged Out'
  end
end
