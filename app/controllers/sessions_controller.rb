class SessionsController < ApplicationController

  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(:email => params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      render :login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
