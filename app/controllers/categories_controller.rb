class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @category = Category.all

  end
  def show
    @category = Category.find_by_name(params[:id])
    @picture = Picture.order(like_count: :desc).paginate(:page => params[:page], :per_page => 5).find_all_by_category_id(@category)
  end
end
