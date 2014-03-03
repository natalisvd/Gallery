class EventsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @events = Event.where(:user_id => params[:user_id], :eventable_type => params[:eventable_type]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15)
  end
end
