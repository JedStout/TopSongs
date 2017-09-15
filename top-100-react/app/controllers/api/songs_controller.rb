class Api::SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def create
    attr = params.require(:Song).permit( :title, :artist, :rank, :genre)
    song = Song.new(attrs)
    if Song.save
        render json: song
    else
        render json: { errors: song.errors }, status: 422
    end
  end

  def update
    song = Song.find(params[:id])
    song.update(complete: !song.complete)
    render json: song
  end

  def destroy
    Song.find(params[:id]).destroy
  end
end
