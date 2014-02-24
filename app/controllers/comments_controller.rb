class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def new
    i = o
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.picture = @picture
    @comment.save
    Resque.enqueue(CommentEvent, @comment.id)
    Pusher['test-channel'].trigger('test-event',comment: @comment, picture: @comment.picture.url, user: current_user.name)
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

