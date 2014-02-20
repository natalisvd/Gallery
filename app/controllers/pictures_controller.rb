class PicturesController < ApplicationController
  before_filter :authenticate_user!
  def index
    false
    @picture = Picture.order(like_count: :desc)
  end
  def show
    @category = Category.find_by_name(params[:category_id])
    @picture = Picture.find(params[:id])
  end
  def create
    @picture = Picture.new
  end
end
