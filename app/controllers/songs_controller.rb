class SongsController < ApplicationController
  def index
    @search = params["search"]
    if @search.present?
      @songs = Song.all.where(level: @search["level"], style: @search["style"])
    else
      @songs = Song.all
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  # private

  # def song_params
  #   params.require(:song).permit(:level, :style)
  # end
end
