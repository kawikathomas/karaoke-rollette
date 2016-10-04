class Api::UsersController < ApplicationController
  skip_before_filter :parse_request, only: [:show]
  def show
    @user = User.find(params[:id])
    if @user
      render json: { user: @user, playlist: @user.playlist.to_json(include:[:songs, :user])  }
    end
  end

  def new
    # facebook login page?
    @user
  end

  def create
    # parse facebook data to create a new user
    # @user = User.new(name: , email: , facebook_id: , token: )
  end

  def edit
    # find the user to add a party id to
  end

  def update
    #add party id to the user
  end

end


