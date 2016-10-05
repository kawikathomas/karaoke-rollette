class Api::SongMatchesController < ApplicationController

  def create
    @song_match = SongMatch.new(user_id: random_singer_id, song_id: random_song_id, party_id: @party.id)
    @song_match.save
    render @song_match.to_json
  end

end






