class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :tweet
	
	validates :user_id, :tweet_id, :presence => true
end
