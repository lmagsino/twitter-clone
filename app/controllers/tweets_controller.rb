class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user = current_user
    @tweet.type = :Tweet
    @tweet.save
    respond_to do |f|
      f.html { redirect_back fallback_location: home_path }
    end
  end

  def update
    @tweet = Tweet.find params[:id]
    @tweet.update tweet_params
    respond_to do |f|
      f.html { redirect_back fallback_location: home_path }
    end
  end

  def destroy
    @tweet = Tweet.find params[:id]
    @tweet.delete
    respond_to do |f|
      f.html { redirect_back fallback_location: home_path }
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit :content
  end

end
