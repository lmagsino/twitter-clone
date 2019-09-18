class TweetsController < ApplicationController

    def destroy
      @tweet = Tweet.find params[:id]
      @tweet.delete
      respond_to do |f|
        f.html { redirect_back fallback_location: home_path }
      end
    end

end
