class RepliesController < ApplicationController

  def create
    @tweet = Reply.new tweet_params
    @tweet.user = current_user
    @tweet.save
    respond_to do |f|
      f.html { redirect_back fallback_location: root_path }
    end
  end


private

  def tweet_params
    params.require(:reply).permit :content, :tweet_id
  end

end
