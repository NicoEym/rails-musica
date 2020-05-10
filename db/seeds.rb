# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require 'csv'




# def seed_level(level_array)

#   level_array.each do |level|
#     Level.create(name: level)
#     puts "Creating #{level}"
#   end

# end

# def seed_style(style_array)

#   style_array.each do |style|
#     Style.create(name: style)
#     puts "Creating #{style}"
#   end

# end


level_seed = ["Débutant", "Intermédiaire", "Expert"]

style_seed = ["Rap/RnB/Soul", "Variet'", "Jazz", "Reggae", "Pop/Rock"]

seed_level(level_seed)
seed_style(style_seed)



csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filesongs    = 'songs.csv'



CSV.foreach(filesongs, csv_options) do |row|
  Artist.create(name: row['artist'])
  puts "Creating #{artist.name}"

end





CSV.foreach(filesongs, csv_options) do |row|

  Artist.create(name: row['artist']) ? Artist.where(name: row['artist']).empty?

  artist_id = Artist.find_by(name: row['artist']).id
  level_id = Level.find_by(name: row['level']).id
  style_id = Style.find_by(name: row['style']).id


  Song.create(title: row['title'], artist_id: artist_id, level_id: level_id, style_id: style_id, link_ytb: row['link_ytb'], link_lyrics: row['link_lyrics'] )
end




html_content = open('https://www.paroles-musique.com/paroles-Christophe_Mae-Dingue_Dingue_Dingue-lyrics,p117659').read
doc = Nokogiri::HTML(html_content)

doc.search('#lyrics').each_with_index do |element, index|
  puts "#{index + 1}. #{element.text.strip}"
end



# def seed_artist(artist_array)

#   artist_array.each do |artist|
#     Artist.create(name: artist)
#     puts "Creating #{artist}"
#   end

# end






# Level.delete_all
# Style.delete_all
# Artist.delete_all
# Song.delete_all






# seed_artist(artist_seed)
# seed_song(ref_song)
