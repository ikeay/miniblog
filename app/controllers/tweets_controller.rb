class TweetsController < ApplicationController
before_filter :authenticate_user!, :only=>[:show, :create, :destroy]
	def show
	@tweet = Tweet.find(params[:id])
	end
	
   def create
    @tweet = current_user.tweets.build(params[:tweet])
    if @tweet.save
    	flash[:notice] = 'Tweet was succrssfully created.'
    else
    	flash[:alert] = 'Tweet was not created.'
    end
    redirect_to root_url
    #respond_to do |format|
      #if @tweet.save
        #format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        #format.json { render json: @tweet, status: :created, location: @tweet }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @tweet.errors, status: :unprocessable_entity }
      #end
    #end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
	redirect_to root_url
    #respond_to do |format|
      #format.html { redirect_to tweets_url }
      #format.json { head :no_content }
    #end
  end
  
  def retweet
  	original_tweet = Tweet.find(params[:id])
  	flash[:notice] = original_tweet.retweet_by(current_user)
  	redirect_to root_path
  end
  
end
