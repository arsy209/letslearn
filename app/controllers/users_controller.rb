class UsersController < ApplicationController

  def index
  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success]= "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
  end


  private

  def users_params
    params.require(:user).permit(:photo,:email,:first_name,:last_name,:bio, :password)
  end
end
