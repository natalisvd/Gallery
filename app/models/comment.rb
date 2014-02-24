class Comment < ActiveRecord::Base
  attr_accessible :picture_id, :user_id, :body

  belongs_to :picture
  belongs_to :user
  has_many :events, :as => :eventable

  validates :body, :length => { :maximum => 100}


end
