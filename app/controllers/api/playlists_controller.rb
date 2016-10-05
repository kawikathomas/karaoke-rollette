class Api::PlaylistsController < ApplicationController
  # before_action :set_playlist
  before_action :set_user

  def index
    # playlist = @user.playlist.playlist_songs.order('created_at DESC')
    render json: @user.playlist.to_json(include: [:songs, :user])
  end

  def destroy
    # User cannot destroy their playlist, they can only delete songs and empty playlist
  end


end
