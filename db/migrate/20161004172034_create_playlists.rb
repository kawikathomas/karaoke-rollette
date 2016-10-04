class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
