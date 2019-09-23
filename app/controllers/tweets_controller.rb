class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user = current_user
    @tweet.save

    @tweets = Tweet.general
    @current_user_tweets = Tweet.general.user current_user

    update_tweet_by_conversation_id
    respond_to do |format|
      format.js
    end
  end

  def update
    @tweet = Tweet.find params[:id]
    @tweet.update tweet_params

    @tweets = Tweet.general
    @current_user_tweets = Tweet.general.user current_user

    update_tweet_by_conversation_id
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find params[:id]
    @tweet.delete

    respond_to do |f|
      f.html { redirect_back :fallback_location => home_path }
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit :content, :tweet_id
  end

  def update_tweet_by_conversation_id
    @tweet = Tweet.find params[:conversation_id] if params[:conversation_id]
  end

end
