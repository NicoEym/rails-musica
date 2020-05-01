class SongsController < ApplicationController
  def index
    @songs = Song.all
    # where(level: params[:level], style: params[:style])
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:level, :style)
  end
end
