class Tweet < ApplicationRecord

  before_save :assign_type

  belongs_to :user
  has_many :replies

  validates :user_id, :presence => true
  validates :content, :presence => true, :length => {:maximum => 140}

  default_scope -> { order :created_at => :desc }

  scope :general, -> { where :type => :Tweet }
  

  private

  def assign_type
    self.type = :Reply if self.tweet_id
  end

end
