class PagesController < ApplicationController

  skip_before_action :require_login, :only => :index

  def home
    @tweets = General.all
  end

  def profile
    @tweets = General.all.where('user_id = ?', current_user.id)
  end

  def conversation
    @tweet = Tweet.find_by_id params[:id]
    redirect_to home_path unless @tweet
  end

end
