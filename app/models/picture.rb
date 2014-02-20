class Picture < ActiveRecord::Base
  belongs_to :category
  mount_uploader :url, PictureUploader
  attr_accessible :url, :category_id, :title
  has_many :likes
  has_many :comments, :dependent => :destroy
end
