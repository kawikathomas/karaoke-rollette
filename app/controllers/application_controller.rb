class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  before_action :parse_request, only: [:create, :update, :delete]
  before_action :set_user
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

  def set_playlist
    @playlist = @user.playlist
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :name, :password, :password_confirmation)}
  end

end
