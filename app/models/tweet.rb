class Tweet < ActiveRecord::Base
has_many :favorites, :dependent => :destroy
belongs_to :user

belongs_to :original_tweet, :class_name => "Tweet"
has_many :retweets, :class_name => "Tweet", :foreign_key => "original_tweet_id"

 def retweet_by(retweeter)
 	if self.user == retweeter
 		"Sorry, you can't retweet your own tweets"
 	elsif self.retweets.where(:user_id => retweeter.id).present?
 		"You already retweeted!"
 	else retweeter.tweets.create(
 		:content => "RT #{self.user.username}: #{self.content}",
 		:original_tweet => self
 		)
 		"Succesfully retweeted"
 	end
end

#presence...if contents is brank, it become error
validates :user_id, :content, :presence => true
validates :content, :length => {:maximum => 140}
end
