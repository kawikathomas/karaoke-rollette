class Api::SongsController < ApplicationController
  # before_filter :find_song
  before_action :set_user
  before_action :set_playlist

  def index
    render json: Song.all
  end

  def create
    @playlist ||= Playlist.find_or_create_by(user_id: @user.id)
      puts "++++++++++++++++++++++#{JSON.parse(request.body.read)}+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      @song ||= Song.find_or_create_by(title: @json['title'], artist: @json['artist'], image_src: @json['img_src'])
      @playlist_song = PlaylistSong.find_or_create_by(playlist_id: @playlist.id, song_id: @song.id)
  end

  private

  def find_song
    @song = Song.find_by(title: @json['title'])
  end

end
