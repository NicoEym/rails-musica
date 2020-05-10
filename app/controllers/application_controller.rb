class ApplicationController < ActionController::Base
    # @styles = Style.all
    # @levels = Level.all
    # @songs = Song.all

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
