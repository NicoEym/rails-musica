class AddLinkLyricsToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :link_lyrics, :string
  end
end
