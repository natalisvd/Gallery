class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  has_many :events, :as => :eventable
  after_create :create_like
  def create_like
    self.events.create(:eventable_body => self.picture_id, :user_id => self.user_id)
  end
end
