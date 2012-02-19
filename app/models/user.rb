class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user  
  has_many :favorites, :dependent => :destroy
  has_many :tweets, :dependent => :destroy
validates :username, :presence => true 
validates :username, :uniqueness => { :case_sensitive => false }
validates :username, :format => { :with => /^[A-Za-z][0-9A-Za-z_\-]+$/ } 
validates :username, :length => { :in => 4..16 }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,  :username, :bio

 def update_with_password(params={})
 	params.delete(:current_password)
 	self.update_without_password(params)
 end
end
