class SongsController < ApplicationController
  def index
    #we declare the results of the search from the home page
    @search = params["search"]

    #we declare the results of the click on the navbar
    @level_params = params[:level]
    @style_params = params[:style]

    #if the request come from the home page we go through the first condition that will deal with the form
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
    #if not, then the request come from the navbar, and we will deal with the level...
    elsif @level_params.present?
      puts "params level present"
      @songs = Song.where(level: params[:level])

    # ... or the style
    elsif @style_params.present?
      puts "params style present"
      @songs = Song.where(style: params[:style])

    #if no choice has been made, we will display all the songs
    else
      @songs = Song.all

    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:songs).permit(:level, :style)
  end
end
