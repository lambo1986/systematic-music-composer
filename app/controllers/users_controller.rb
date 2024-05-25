class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.build(user_params)
    if @user.save
      redirect_to root_path, notice: "Welcome, #{@user.name}!"
    else
      flash[notice]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
