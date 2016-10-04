class Api::MessagesController < ApplicationController

  def create
    @message = Message.create(content: @json['content'], user_id: @json['user_id'], chatroom_id: @json['chatroom_id'])
    render json: @message
    if message.save
      # do some stuff
    else
      head 404
    end
  end

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end

end
