class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @categories = Category.all

  end
  def show
    @category = Category.find_by_name(params[:id])
    @pictures = Picture.where(:category_id => @category.id).order(like_count: :desc).paginate(:page => params[:page], :per_page => 5)
  end
end
