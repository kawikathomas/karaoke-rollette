class SongMatch < ApplicationRecord

  belongs_to :party
  belongs_to :user
  belongs_to :song

end
