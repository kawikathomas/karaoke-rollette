class GamesController < ApplicationController

  def song
    party_playlist = @party.build_playlist
    index = rand(0..party_playlist.length)
    @song = party_playlist[index]
    render @song.to_json
  end

  def singer
    game_users = @party.users
    index = rand(0..game_users.length)
    @singer = game_users[index]
    render @singer.to_json
  end

end



