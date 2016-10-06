class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  before_action :parse_request, only: [:create, :update, :delete]
  before_action :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def find_playlist_id(user)
    user.playlist.id
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

  def set_user
    puts request.headers["uid"]
    @user = User.find_by(uid: request.headers['uid'])
  end

  def set_playlist
    @playlist = @user.playlist
  end

  def random_song_id
    party_playlist = @party.build_playlist
    index = rand(0..party_playlist.length)
    @song = party_playlist[index]
  end

  def random_singer_id
    game_players = @party.users
    index = rand(0..game_players.length)
    @singer = game_players[index]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end

end
