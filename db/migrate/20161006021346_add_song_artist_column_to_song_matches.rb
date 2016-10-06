class AddSongArtistColumnToSongMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :song_matches, :song_artist, :string
  end
end
