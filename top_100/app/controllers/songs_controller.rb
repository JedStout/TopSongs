class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all.order(:rank)
  end

  def show
  end

  def new
    @songs = Song.new
  end

  def create
    song = Song.new(song_params)

    if song.save
      redirect_to songs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(
      :title,
      :artist,
      :rank,
      :genre
    )
  end
end
