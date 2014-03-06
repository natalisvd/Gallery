require 'spec_helper'
describe Comment do
  before do
    @comment = Comment.new(id: 1,body: 'ahgd jhjfg', picture_id: 1, user_id:1)
  end
  subject { @comment }
  it { @comment.should respond_to(:body) }
  it { @comment.should respond_to(:user) }
  it { @comment.should respond_to(:picture) }
  it{@comment.should respond_to(:events)}
  it "should require a email" do
    Comment.new(:body => "").should_not be_valid
  end



end