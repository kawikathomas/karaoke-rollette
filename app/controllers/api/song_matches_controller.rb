class Api::SongMatchesController < ApplicationController

  before_action :random_song
  before_action :random_singer

  def create
    @singer = random_singer
    @random_song = random_song
    @song_match = SongMatch.new(user_id: @singer.id, singer_name: @singer.name, song_title: @random_song.title, song_artist: @random_song.artist, song_id: @random_song.id, party_id: @user.party.id)
    @song_match.save
    # check to_json if not getting correct data
    render json: @song_match.to_json
  end

  def matches_data
    @song_matches = SongMatch.where(party_id: @user.party.id)
    # render json: @user.party.as_json(include: [song_matches: {include: [:song, :user, :party]}])
    render json: @song_matches.as_json
  end

  def destroy
    # song id?
    @song_match = SongMatch.find_by(user_id: @user.id, song_id: params[:id], party_id: @user.party.id)
    @song_match.song.id = nil
    puts "song id: #{@song_match.song.id}  ============= "
    @song_match.user.party.id = nil
    puts "party id: #{@song_match.user.party.id}  ============= "
    @song_match.user_id = nil
    puts "user id: #{@song_match.user.id}  ============= "
    # @song_match.destroy
  end

end






