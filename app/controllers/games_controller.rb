class GamesController < ApplicationController
  def song
    songs = @user.playlist.songs
    index = rand(0..songs.length)
    @song = songs[index]
    render @song.to_json
  end
end
