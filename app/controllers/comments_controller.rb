class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @comments = Comment.preload(:user).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def create
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.create(comment_params.merge(:user => current_user, :picture => @picture))
    if @comment.save
      Event.create(:user_id => current_user.id, :eventable_type => "Comment", :eventable_body => "#{request.original_url}")
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

