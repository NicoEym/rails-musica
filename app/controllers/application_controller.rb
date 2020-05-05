class ApplicationController < ActionController::Base


     @styles = Style.all
    @levels = Level.all
    @songs = Song.all
end
