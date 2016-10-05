class Api::PartiesController < ApplicationController
  before_action :set_user

  def create
    puts "user: #{@user}"
    puts request.headers['uid']
    @party = Party.new
    if @party.save
      @party.users << @user
      render json: @party.to_json(methods: :token)
    end
  end

  def update
    # compare json data with the party user list and find unique key value pairs
    # add them to the list
  end

  def destroy
  end

end
