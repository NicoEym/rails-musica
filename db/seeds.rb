
require 'open-uri'
require 'nokogiri'
require 'csv'

Song.delete_all
Artist.delete_all
Level.delete_all
Style.delete_all




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

style_seed = ["Rap/RnB/Soul", "Variété", "Jazz", "Reggae", "Pop/Rock"]

seed_level(level_seed)
seed_style(style_seed)



csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filesongs    = 'db/csv_repos/songs.csv'

CSV.foreach(filesongs, csv_options) do |row|

  if Artist.where(name: row['artist']).empty?
    Artist.create(name: row['artist'])
    puts "Creating #{row['artist']}"
    puts "#{Artist.find_by(name: row['artist'])}"

  end

  artist_id = Artist.find_by(name: row['artist']).id
  puts artist_id
  level_id = Level.find_by(name: row['level']).id
  puts level_id
  style_id = Style.find_by(name: row['style']).id
  puts style_id


  # html_content = open(row['link_lyrics']).read
  # doc = Nokogiri::HTML(html_content)

  # doc.search('#lyrics').each do |element|
  #   lyrics = element.text.strip
  # end

  Song.create(title: row['title'], artist_id: artist_id, level_id: level_id, style_id: style_id, lyrics: row['lyrics'], link_ytb: row['link_ytb'], link_lyrics: row['link_lyrics'] )
  puts "Creating #{row['title']}"
  puts "#{Song.find_by(title: row['title'])}"
end











