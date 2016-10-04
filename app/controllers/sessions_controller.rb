class SessionsController < ApplicationController
  def show
  end

  def create
    User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
  end

  def destroy
    session[:user_id] = nil
  end
end
