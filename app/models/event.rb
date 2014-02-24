class Event < ActiveRecord::Base
  belongs_to :eventable, :polymorphic => true
  belongs_to :user
  def self.track_event(type, data = {})
    ActiveSupport::Notifications.instrument(type, data)
  end
  attr_accessible :user_id, :eventable_type, :eventable_id, :eventable
end