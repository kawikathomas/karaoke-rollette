class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :image_src
      t.integer :popularity

      t.timestamps null: false
    end
  end
end
