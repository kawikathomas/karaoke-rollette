class Api::ArtistsController < ApplicationController

 def index
    puts "is this working"
   if params[:artist_name]
     @artists = RSpotify::Artist.search(params[:artist_name])
     render :json, {artists: @artists}
   # else
   #   redirect_to root_path
   end
 end

 def show
  @artist = RSpotify::Artist.find(params[:id])
end
end
