class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  before_filter :parse_request, only: [:create, :update, :delete]

  def user_playlist(user)
    @playlist = Playlist.find(find_playlist_id(user)).songs
    user.playlist.songs
  end

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


  # private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # helper_method :current_user
end
