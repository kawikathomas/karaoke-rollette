class GamesController < ApplicationController

  def song


    songs = @user.playlist.songs
    index = rand(0..songs.length)
    @song = songs[index]
    render @song.to_json
  end

  def singer
    game_users = @party.users
    index = rand(0..game_users.length)
    @singer = game_users[index]
    render @singer.to_json
  end

end



