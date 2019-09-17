class GeneralsController < ApplicationController

  def create
    @tweet = General.new tweet_params
    @tweet.user = current_user
    @tweet.save
    respond_to do |f|
      f.html { redirect_to home_path}
    end
  end


  private

  def tweet_params
    params.require(:general).permit :content
  end

end
