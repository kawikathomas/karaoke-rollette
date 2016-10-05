class SongMatch < ApplicationRecord

  belongs_to :party, dependent: :destroy
  belongs_to :user
  belongs_to :song

end
