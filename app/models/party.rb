class Party < ApplicationRecord
  has_many :users
  has_many :playlists, through: :users
  has_many :song_matches

  def token
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(5) { charset.sample }.join
  end

end
