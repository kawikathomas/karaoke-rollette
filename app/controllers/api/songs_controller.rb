class Api::SongsController < ApplicationController
  # before_filter :find_song
  before_action :set_user
  before_action :set_playlist

  def index
    render json: Song.all
  end

  def create
    @song ||= Song.create(title: @json['title'], artist: @json['artist'], image_src: @json['image_src'])
    @playlist ||= Playlist.create(user_id: @user.id)
    @playlist_song = PlaylistSong.create(playlist_id: @playlist.id, song_id: @song.id)
    render json: @playlist_song.to_json
  end


  private

  def find_song
    @song = Song.find_by(title: @json['title'])
  end

end
