class AddSongTitleColumnToSongMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :song_matches, :song_title, :string
  end
end
