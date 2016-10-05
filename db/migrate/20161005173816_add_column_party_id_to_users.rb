class AddColumnPartyIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :party_id, :integer
  end
end
