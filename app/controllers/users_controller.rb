class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user_params[:password] != user_params[:password_confirmation]
      flash.now[:alert] = "Passwords do not match."
      render :new
    elsif @user.save
      redirect_to root_path, notice: "Welcome, #{@user.name}!"
    else
      flash.now[:alert] = "FAILED to Create User!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
