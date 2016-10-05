class Api::SessionsController < ApplicationController
  def new
  end

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
