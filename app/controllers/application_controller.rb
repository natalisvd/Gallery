class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers

  after_filter :nav, action: [:show, :index]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User) or resource_or_scope.eql?(:user)
      Event.create(:eventable_type => 'Sign_in', :user_id => current_user.id)
      categories_path
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource_or_scope.is_a?(User) or resource_or_scope.eql?(:user)
      Event.create(:eventable_type => 'Sign_in', :user_id => current_user.id)
      categories_path
    else
      super
    end
  end


  private
  def nav
    if  current_user
      Event.create(:user_id => current_user.id, :eventable_type => "Navigation", :eventable_body => "#{request.original_url}")
    end
  end
end
