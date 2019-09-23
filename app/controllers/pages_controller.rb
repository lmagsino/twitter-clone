class PagesController < ApplicationController

  skip_before_action :require_login, :only => :index
  before_action :redirect_if_login, :only => :index

  def home
    @tweets = Tweet.general
  end

  def profile
    @current_user_tweets = Tweet.general.user current_user
  end

  def conversation
    @tweet = Tweet.find_by_id params[:id]
    redirect_to home_path unless @tweet
  end


  private

  def redirect_if_login
    redirect_to home_path if logged_in?
  end

end
