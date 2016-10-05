class User < ActiveRecord::Base
  has_one :playlist
  belongs_to :party
  has_many :song_matches


  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # def self.from_omniauth(auth)
  #   where(auth.slice("provider", "uid")) || create_from_omniauth(auth)
  # end

  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]
  #   end
  # end
end
