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

# Level.delete_all
# Style.delete_all
# Artist.delete_all
# Song.delete_all

def scraping(link)

  html_content = open(link).read
  doc = Nokogiri::HTML(html_content)

  doc.search('#lyrics').each do |element|
    letras = element.text.strip
  end
  letras
end

def seed_level(level_array)

  level_array.each do |level|
    Level.create(name: level)
    puts "Creating #{level}"
  end

end

def seed_style(style_array)

  style_array.each do |style|
    Style.create(name: style)
    puts "Creating #{style}"
  end

end


level_seed = ["Débutant", "Intermédiaire", "Expert"]

style_seed = ["Rap/RnB/Soul", "Variet'", "Jazz", "Reggae", "Pop/Rock"]

seed_level(level_seed)
seed_style(style_seed)



csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filesongs    = '/db/csv_repos/songs.csv'

CSV.foreach(filesongs, csv_options) do |row|

  if Artist.where(name: row['artist']).empty?
    Artist.create(name: row['artist'])
    puts "Creating #{row['artist']}"
  end

  artist_id = Artist.find_by(name: row['artist']).id
  level_id = Level.find_by(name: row['level']).id
  style_id = Style.find_by(name: row['style']).id
  lyrics = scraping(row['link_lyrics'])

  Song.create(title: row['title'], artist_id: artist_id, level_id: level_id, style_id: style_id, lyrics: lyrics, link_ytb: row['link_ytb'], link_lyrics: row['link_lyrics'] )
  puts "Creating #{row['title']}"

end











