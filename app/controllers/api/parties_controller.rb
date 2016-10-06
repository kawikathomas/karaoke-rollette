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
    if !@party.users.include?(@user)
      @party.users << @user
      render json: @party.as_json(include: [:users, playlists: {include: :songs}])
    end
  end

  def remove_player
    puts "#{@user.party_id} =============================="
    @party = @user.party
    i = @party.users.index(@user)
    @party.delete(i)
    @user.party_id = nil
    puts "#{@user.party_id} =============================="
  end

  def players_data
    @players = User.where(party_id: @user.party.id)
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
