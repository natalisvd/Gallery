require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
 test "should comment create" do
   assert_difference('Comment.count') do
   end

 end

end
