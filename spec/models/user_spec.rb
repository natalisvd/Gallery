require 'spec_helper'
describe User do
  before do
    @user = User.new(email: "aa@bb.c", password: '1234567890', password_confirmation: "1234567890")
  end
  subject { @user }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it "should have a pictures  method"     do
  @user.should respond_to(:pictures)
  end
  it "should have a comments method"     do
  @user.should respond_to( :comments)
  end
  it "should have a likes method"     do
  @user.should respond_to(:likes)
  end
  it "should have a events method"     do
  @user.should respond_to(:events)
  end
  it "should require a email" do
    User.new(:email => "").should_not be_valid
  end

end