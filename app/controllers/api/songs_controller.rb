class Api::SongsController < ApplicationController
  # before_filter :find_song

  def index
    render json: Song.all
  end

  def create
    if @song.present?
      render nothing: true # no error is rendered
    else
      song_params = params[:song]
      @song ||= Song.create(title: song_params[:title], artist: song_params[:artist_name])
      @playlist_song = PlaylistSong.create(playlist_id: current_user.playlist.id, song_id: @song.id)
      render :json, {song: @song, playlist_song: @playlist_song}
      # redirect_to api_artist_path(song_params[:artist_id])
        # @song = Song.new
      # @song.assign_attributes(title: @json['title'], artist: @json['artist'])
      # render json: @song if @song.save
    end
  end

  private
  def find_song
    @song = Song.find_by(title: @json['title'])
  end

end
