class Api::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(auth_hash)
    user.playlist = Playlist.create
    session[:user_id] = user.id
    render json: { user: user, playlist: user.playlist.to_json(include:[:songs, :user])  }
  end

  def destroy
    session[:user_id] = nil
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
