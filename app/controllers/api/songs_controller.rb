class Api::SongsController < ApplicationController
  # before_filter :find_song
  before_action :set_playlist
  before_action :set_user

  def index
    render json: Song.all
  end

  def create
    @playlist ||= Playlist.create(user_id: @user.id)
    if @song.present?
      render nothing: true # no error is rendered
    else
      puts "++++++++++++++++++++++#{JSON.parse(request.body.read)}+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      @song ||= Song.create(title: @json['title'], artist: @json['artist'], image_src: @json['img_src'])
      @playlist_song = PlaylistSong.create(playlist_id: @playlist.id, song_id: @song.id)
      # render :json, {song: @song, playlist_song: @playlist_song}
      # render json: @tracks.to_json
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
