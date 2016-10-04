class Party < ApplicationRecord
  has_many :users
  has_many :playlists, through: :users

  def token
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(5) { charset.sample }.join
  end

end
