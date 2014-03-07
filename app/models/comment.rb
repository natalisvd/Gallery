class Comment < ActiveRecord::Base

  belongs_to :picture
  belongs_to :user
  has_many :events, :as => :eventable

  validates :body, :length => {:minimum => 1}


end
