class LikesController < ApplicationController
  before_filter :authenticate_user!
def index

end
  def new
    @like= Like.new(params[:like])
    @like.picture = Picture.find(params[:picture_id])
    @like.user = current_user
    Picture.increment_counter(:like_count, @like.picture)

    @like.save
    Resque.enqueue(LikeEvent, @like.id)

   redirect_to :back
  end
  def destroy
    like = current_user.likes.where(:picture_id  => params[:picture_id ])
    if !like.blank?
      like.destroy_all
      Picture.decrement_counter(:like_count, Picture.find(params[:picture_id]))
    end

    redirect_to :back
  end
end
