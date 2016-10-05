class SongsController < ApplicationController
  def create
      @playlist ||= Playlist.create(user_id: @user.id)
      @song = Song.new(params)

      respond_to do |format|
        if @song.save
          format.html { redirect_to @song, notice: "Song has been added" }
          format.json { render json: @song }
        else
          format.html { render :new }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
    end
  end
end

