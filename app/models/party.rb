class Party < ApplicationRecord
  has_many :users
  has_many :playlists, through: :users
  has_many :song_matches

  def token
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(5) { charset.sample }.join
  end

 # build party queue
  def build_playlist
    party_queue = []
    queues = playlists.each do |playlist|
      playlist.songs.each do |song|
        party_queue << song
      end
    end
    party_queue
  end

  # def song
  #   party_playlist = @party.build_playlist
  #   index = rand(0..party_playlist.length)
  #   @song = party_playlist[index]
  #   render @song.to_json
  # end

  # def singer
  #   game_users = @party.users
  #   index = rand(0..game_users.length)
  #   @singer = game_users[index]
  #   render @singer.to_json
  # end

end
