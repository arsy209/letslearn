class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :authorized?, :current_user

def login(user)
  session[:user_id] = user.id
end

def logged_in?
  !!current_user
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def authorized?(user)
  logged_in? && current_user == user
end

def require_user
  if !logged_in?
    flash[:danger] = "Only Logged in Users can perform this action."
    redirect_to root_path
  end
end
end
