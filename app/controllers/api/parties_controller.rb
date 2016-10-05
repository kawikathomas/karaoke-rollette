class Api::PartiesController < ApplicationController
  before_action :set_user

  def create
    @party = Party.new
    if @party.save
      @party.users << @user
      render json: @party.to_json(methods: :token)
    end
  end

  def update
    @party = Party.find(params[:id])
    @party << @user
  end


    # compare json data with the party user list and find unique key value pairs
    # add them to the list
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
  end

end
