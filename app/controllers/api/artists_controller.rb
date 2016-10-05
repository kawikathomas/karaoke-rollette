class Api::ArtistsController < ApplicationController

  def index
    puts "#{params.inspect} ==========================================="

    if params[:track_name]
       @tracks = RSpotify::Tracks.search(params[:track_name])
       render json: @tracks.to_json
    end
  end

 def show
  @track = RSpotify::Tracks.find(params[:id])
end
end
