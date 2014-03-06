require 'spec_helper'
describe Picture do
  before do
    @picture = Picture.new(category_id:1)
  end
  subject {@picture}
  #@picture.should respond_to(:categories)
  it { @picture.should respond_to(:category) }
  it "should have a comments method"     do
    @picture.should respond_to( :comments)
  end
  it "should have a likes method"     do
    @picture.should respond_to(:likes)
  end

end