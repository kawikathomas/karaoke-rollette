class SessionsController < ApplicationController
  def show

  end

  # def create
  #   User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  # end

  def destroy
    session[:user_id] = nil
  end
  private
  def auth_hash
    request.env["omniauth.auth"]
  end
end




