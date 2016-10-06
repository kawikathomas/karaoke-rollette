class Api::SongMatchesController < ApplicationController

  before_action :random_song_id
  before_action :random_singer_id

  def create
    @song_match = SongMatch.new(user_id: random_singer_id, song_id: random_song_id, party_id: @party.id)
    @song_match.save
    render @song_match.to_json
  end

  def matches_data
    @song_matches = SongMatch.where(party_id: @user.party.id)
    render json: @song_matches.as_json
  end

  def destroy
    @song_match = SongMatch.find_by(user_id: random_singer_id, song_id: random_song_id, party_id: @party.id)
    @song_match.destroy
  end

end






