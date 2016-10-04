class Api::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(auth_hash)
    user.playlist = Playlist.create
    session[:user_id] = user.id
    render json: { user: user, playlist: user.playlist.to_json(include:[:songs, :user])  }
  end

  def create
    user = User.from_omniauth(auth_hash)
    user.playlist = Playlist.create
    session[:user_id] = user.id
    render json: { user: user, playlist: user.playlist.to_json(include:[:songs, :user])  }
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     @user.playlist = Playlist.create
  #     render json: { user: @user }, status: :ok
  #   else
  #     status 422
  #   end
  # end

  def destroy
    session[:user_id] = nil
  end

  protected

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
