class SongsController < ApplicationController
    before_action :load_artist
    def new
      @song = @artist.songs.new
    end
    def show
      @song = @artist.songs.find(params[:id])
    end

    def create
      @song = @artist.songs.new(song_params)

      if @song.save
        redirect_to @artist, notice: "song created"
      else
        render :new
      end
    end

    def destroy
      song = @artist.songs.find(params[:id])
      song.destroy
      redirect_to artist_path(@artist), notice: "Song succesfully removed"
    end

    private

    def load_artist
      @artist = Artist.find(params[:artist_id])
    end

    def song_params
      params.require(:song).permit(:name, :release_date, :genre)
    end
end
