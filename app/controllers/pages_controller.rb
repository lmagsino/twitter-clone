class PagesController < ApplicationController

  skip_before_action :require_login, :only => :index
  before_action :initialize_new_tweet, :except => :index

  def home
    @tweets = General.all
    @comment = General.new
  end

  def profile
    @tweets = General.all.where('user_id = ?', current_user.id)
  end

  def conversation
    @tweet = Tweet.find(params[:id])
    @replies = @tweet.replies
  end


  private

  def initialize_new_tweet
    @newTweet = General.new
  end

end
