class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  before_filter :authenticate_user!
  after_filter :nav, action: [:show, :index]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   def nav
    if  current_user
      Event.create(:user_id=>current_user.id, :eventable_type => "Navigation", :eventable_body => "#{request.original_url}")
    end
   end



end
