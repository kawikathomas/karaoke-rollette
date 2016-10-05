class Api::PartyController < ApplicationController

  def new
  end

  def create
    if @party.present?
      render nothing: true
    else
      @party = Party.new
      if @party.save
        @party.users << current_user
        render json: @party.to_json(methods: :token)
      end
    end
  end

  def update
    # compare json data with the party user list and find unique key value pairs
    # add them to the list
  end

  def destroy
  end

  def set_party
    @party = User.find_by(name: params[:users]).playlist
  end

end
