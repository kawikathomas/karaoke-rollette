class Api::SongsController < ApplicationController
  # before_filter :find_song

  def index
    render json: Song.all
  end

  def create
    if @song.present?
      render nothing: true # no error is rendered
    else
      @song = Song.new
      @song.assign_attributes(title: @json['title'], artist: @json['artist'])
      render json: @song if @song.save
    end
  end

  private
  def find_song
    @song = Song.find_by(title: @json['title'])
  end

end
