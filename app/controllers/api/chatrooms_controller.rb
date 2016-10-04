class Api::ChatroomsController < ApplicationController

  def new
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end

  def update

  end

  def destroy
  end

end
