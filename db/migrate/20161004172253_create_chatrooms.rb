class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.string :topic
      t.integer :party_id
      t.string :slug

      t.timestamps null: false
    end
  end
end
