class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :pictures, :through => :like, :uniq => true
  has_many :comments, :dependent => :destroy
  has_many :likes
  has_many :events, :as => :eventable

  validates :email, :presence => true, :uniqueness => true

  after_create :create_use

  def create_use
    self.events.create(:eventable_body => "created_at", :user_id => self.id)
  end
end
