class PagesController < ApplicationController
  def home
    @styles = Style.all
    @levels = Level.all
    @songs = Song.all
  end
end
