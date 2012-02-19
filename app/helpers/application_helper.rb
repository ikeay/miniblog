module ApplicationHelper
	def link_to_favorite(tweet)
		if user_signed_in?
			if favorite = current_user.favorites.find_by_tweet_id(tweet)
				link_to "Unfavorite", favorite, :method => "delete"
			else
				link_to "Favorite", favorites_path(:tweet_id => tweet), :method => "post"
			end
		end
	end
	
	def link_to_follow(user)
		if user_signed_in? && current_user != user
			if friendship = current_user.friendships.find_by_friend_id(user)
				link_to "Unfollow", friendship, :method => "delete"
			else
				link_to "Follow", friendships_path(:friend_id => user.id), :method => "post"
			end
		end
	end
	
end
