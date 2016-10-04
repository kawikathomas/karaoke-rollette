class UsersController < ApplicationController

  before_action :set_user
  def show
    @user = current_user
    if @user
      @user = find_or_create_user(@user)
    end
  end

  def new
    # facebook login page?
    @user
  end

  def create
    # parse facebook data to create a new user
    # @user = User.new(name: , email: , facebook_id: , token: )
    @user = User.new(user_params)
    if @user.save
      @user.playlist = Playlist.create
      render json: { user: @user }, status: :ok
    else
      status 422
    end
  end

  def edit
    # find the user to add a party id to
  end

  def update
    #add party id to the user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user
    # @user = User.find(params[:id])
  end
end
