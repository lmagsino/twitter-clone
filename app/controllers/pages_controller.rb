class PagesController < ApplicationController

  skip_before_action :require_login, :only => :index

<<<<<<< HEAD
  def home; end
=======
  def index
  end

  def home
    @tweets = General.all
  end
>>>>>>> adds home page

  def profile
    @tweets = General.all.where('user_id = ?', current_user.id)
  end

end
