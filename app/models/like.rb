class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  has_many :events, :as => :eventable

end
