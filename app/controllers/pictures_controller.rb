class PicturesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pictures = Picture.order(like_count: :desc)
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments.preload(:user)
    @comments_count = @picture.comments.count.to_i
    @like = @picture.likes.find_by_user_id(current_user.id)
  end

end
