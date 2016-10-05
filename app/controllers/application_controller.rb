class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  before_filter :parse_request, only: [:create, :update, :delete]
  before_action :set_user

  # def user_playlist(user)
  #   @playlist = Playlist.find(find_playlist_id(user)).songs
  #   user.playlist.songs
  # end

  def authorize
    # redirect_to '/login' unless current_user
  end

  def find_or_create_user(user)
    @user = Koala::Facebook::API.new(user.oauth_token)
    @user.get_object("me?fields=name,friends,picture")
  end

  private

  def find_playlist_id(user)
    user.playlist.id
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

  def set_user
    @user = User.find_by(uid: request.headers['uid'])
  end



# build party queue

  def build_queue
    party_queue = []
    queues = @party.users.each do |playlist|
      party_queue << playlist.songs
    end

  end


end
