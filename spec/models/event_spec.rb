require 'spec_helper'
describe Event do
  before do
    @event = Event.new(user_id:1)

  end
  subject{@event}
  it { @event.should respond_to(:user) }


end