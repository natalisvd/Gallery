class Comment < ActiveRecord::Base
  attr_accessible :picture_id, :user_id, :body

  belongs_to :picture
  belongs_to :user
  has_many :events, :as => :eventable

  validates :body, :length => { :maximum => 100}

  after_create :create_com
  def create_com
    self.events.create(:eventable_body => self.body, :user_id => self.user_id)
  end
end
