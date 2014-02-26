class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def new
    i = o
  end
  def index
   @comments = Comment.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end
  def show
    @comment = Comment.find(params[:id])
  end


  def create
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.picture = @picture
    @comment.save
    Event.create(:user_id => current_user.id, :eventable_type => "Comment", :eventable_body => "#{request.original_url}")
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

