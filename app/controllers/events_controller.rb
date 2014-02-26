class EventsController < ApplicationController
  def index
    @user = User.all
  end
def  show
  @events = Event.where(:user_id => params[:user_id],:eventable_type=>params[:eventable_type]).paginate(:page => params[:page], :per_page => 15)
end


end
