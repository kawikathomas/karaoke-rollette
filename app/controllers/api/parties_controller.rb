class Api::PartiesController < ApplicationController
  before_action :set_user

  def create
    @party = Party.new
    if @party.save
      @party.users << @user
      # render json: { user: @user, playlist: @user.playlist.to_json(include:[:songs, :user])  }
      render json: @party.to_json(methods: :token)
    end
  end

  def update
    @party = Party.find(params[:id])
    if !@party.users.include?(@user)
      @party.users << @user
      render json: @party.as_json(include: [:users, playlists: {include: :songs}])
    end
  end

  def players_data
    @players = Users.where(party_id: @user.party.id)
    render json: @players.as_json
  end

  def destroy
    @party = Party.find(params[:id])
    @party.users.each do |user|
      user.party_id = nil
    end
    @party.destroy
  end

end
