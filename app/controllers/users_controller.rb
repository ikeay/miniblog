class UsersController < ApplicationController	
  def index
  	@users = User.order("updated_at DESC")
   end
  
  def show
  	@user = User.find(params[:id])
  	@tweets = @user.tweets
  end
  
  def favorites
  	@user = User.find(params[:id])
  	@favorites = @user.favorites.order("created_at DESC")
  	render 'show'
  end
   
   def following
   		@user = User.find(params[:id])
   		@users = @user.friends
   		render 'show'
   	end
   	
   	def followers
   		@user = User.find(params[:id])
   		@users = @user.inverse_friends
   		render 'show'
   	end
end
