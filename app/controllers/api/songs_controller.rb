class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_artist
  def index
    render status: 200, json: @artist.songs
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy

    render status: 200, json: {
      message: "Room successfully deleted"
    }.to_json
  end


  def create
    song = @artist.songs.new(song_params)

    if song.save
      render status: 200, json: {
        message: "Song successfully created",
        artist: @artist,
        song: song
      }.to_json
    else
      render status: 422, json: {
        message: "Song could not be created",
        errors: song.errors
      }.to_json
    end
  end

  def destroy
    song = @artist.songs.find(params[:id])
    song.destroy

    render status: 200, json: {
      message: "song successfully deleted"
    }.to_json
  end
  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:name, :release_date, :genre)
  end
end
