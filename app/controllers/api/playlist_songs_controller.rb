class Api::PlaylistSongsController < ApplicationController
  before_action :set_user

  def destroy
    @playlistsong = PlaylistSong.find_by(song_id: params[:id], playlist_id: @user.playlist.id)
    @playlistsong.destroy
  end

end
