module ApplicationHelper
	def link_to_favorite(tweet)
		if user_signed_in?
			if favorite = current_user.favorites.find_by_tweet_id(tweet)
				link_to "Unfavorite", favorite, :method = "delete"
			else
				link_to "Favorite", favorites_path(:tweet_id => tweet), :method => "post"
			end
		end
end
