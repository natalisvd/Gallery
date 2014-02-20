class AddLikePicture < ActiveRecord::Migration
  def change
    add_column :pictures, :like_count, :integer, :default => 0
  end
end
