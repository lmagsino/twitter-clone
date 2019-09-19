class SessionsController < ApplicationController

  skip_before_action :require_login
  before_action :redirect_if_login, :only => :new

  def create
    user = User.find_by(:email => params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:danger] = "Login Failed."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


  private

  def redirect_if_login
    redirect_to home_path if logged_in?
  end
end
