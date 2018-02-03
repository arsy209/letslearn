class UsersController < ApplicationController

  def index
  end

  def new
  @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: 'Account Creation Successful!'
      else
        render 'new'
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success]= "Your account was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:avatar,:email,:bio, :password,:role)
  end
end
