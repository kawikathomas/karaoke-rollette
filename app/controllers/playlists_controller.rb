class PlaylistsController < ApplicationController
  before_action :set_playlist

  def show
    render json: @playlist, status: :ok
  end

  def edit
  end


  def update
    if @playlist.update(params)
      render json: @playlist, status: :ok
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # User cannot destroy their playlist, they can only delete songs and empty playlist
  end

  private
  def set_playlist
    @playlist = user_playlist(current_user).songs
  end

end
