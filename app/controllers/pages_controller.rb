class PagesController < ApplicationController

  skip_before_action :require_login, :only => :index

  def home
    @tweets = General.all
  end

  def profile
    @tweets = General.all.where('user_id = ?', current_user.id)
  end

  def conversation
    @tweet = Tweet.find(params[:id])
    @replies = @tweet.replies
  end

end
