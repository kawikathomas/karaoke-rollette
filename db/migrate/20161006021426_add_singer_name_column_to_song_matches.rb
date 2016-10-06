class AddSingerNameColumnToSongMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :song_matches, :singer_name, :string
  end
end
