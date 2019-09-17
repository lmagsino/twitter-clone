class UsersController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to home_path
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit :username, :email, :name, :password
  end

end
