class SongsController < ApplicationController
  def index
    @search = params["search"]
    if @search.present?

      if @search['level'].empty? && @search['style'].empty?
        @songs = Song.all

      elsif !@search['level'].empty? && @search['style'].empty?
        @songs = Song.all.where(level: @search["level"])

      elsif @search['level'].empty? && !@search['style'].empty?
        @songs = Song.all.where(style: @search["style"])

      else
        @songs = Song.all.where(level: @search["level"], style: @search["style"])

      end

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
