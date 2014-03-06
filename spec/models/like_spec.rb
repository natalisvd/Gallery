require 'spec_helper'
describe Like do
  before do
    @like = Like.new(id:1, picture_id:1, user_id:1)
  end
  subject { @like }
  it { @like.should respond_to(:user) }
  it { @like.should respond_to(:picture) }
  it{@like.should respond_to(:events)}
end
