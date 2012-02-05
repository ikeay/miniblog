class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorites }
    end
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorite }
    end
  end

  # GET /favorites/new
  # GET /favorites/new.json
  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite }
    end
  end

  # GET /favorites/1/edit
  def edit
    @favorite = Favorite.find(params[:id])
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = current_user.favorites.find_or_initialize_by_tweet_id(params[:tweet_id])
	if @favorite.save!
		flash[:notice] = 'Favorite was successfully created.'
	else
		flash[:alert]= 'Favorite was not created.'
	end
		redirect_to root_url
    #respond_to do |format|
      #if @favorite.save
        #format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        #format.json { render json: @favorite, status: :created, location: @favorite }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @favorite.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PUT /favorites/1
  # PUT /favorites/1.json
  def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
	redirect_to root_url
    #respond_to do |format|
     # format.html { redirect_to favorites_url }
     # format.json { head :no_content }
    # end
  end
end
