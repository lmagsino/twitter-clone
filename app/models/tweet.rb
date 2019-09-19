class Tweet < ApplicationRecord

  before_save :assign_type

  belongs_to :user
  has_many :replies

  validates :user_id, :presence => true
  validates :content, :presence => true, :length => {:maximum => 140}

  default_scope -> { order :created_at => :desc }


  private

  def assign_type
    self.type =
      if self.tweet_id
        :Reply
      else
        :Tweet
      end
  end

end
