class PagesController < ApplicationController
  def home
  	@tweets = Tweet.order("created_at DESC")
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
