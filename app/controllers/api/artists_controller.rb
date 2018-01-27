class Api::ArtistsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: Artist.all
  end

  def show
  artist = Artist.find(params[:id])
  render status: 200, json: artist
end
end
