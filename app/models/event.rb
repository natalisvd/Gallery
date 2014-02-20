class Event < ActiveRecord::Base
  attr_accessible :eventable_body, :eventable_id, :eventable_type, :user_id

  belongs_to :eventable, :polymorphic => true
  belongs_to :user, :dependent => :destroy

  EVENT = %w{Navigation User Comment Like}
  validates :eventable_type, :presence => true, :inclusion => {:in => EVENT}
end
