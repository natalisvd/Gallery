require 'spec_helper'
describe Category do
  before do
    @category= Category.new(name: 'aaa')
  end
  it "should have a pictures method"     do
    @category.should respond_to( :pictures)
  end
end