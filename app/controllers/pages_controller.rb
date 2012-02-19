class PagesController < ApplicationController
  def home
	if user_signed_in?
  		@tweets = Tweet.where("user_id = ? OR user_id IN (?)", current_user, current_user, current_user.friend_ids created_at DESC)
  	else
  	@tweets = Tweet.scoped	
  	end
  	@tweets = Tweet.where(created_at DESC)
  end

  def about
  end

  def privacy
  end

  def terms
  end

  def help
  end
end
