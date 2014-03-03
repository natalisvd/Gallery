class Picture < ActiveRecord::Base
  belongs_to :category
  mount_uploader :url, PictureUploader

  has_many :likes
  has_many :comments, :dependent => :destroy
end
