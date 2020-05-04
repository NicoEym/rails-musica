# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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


def seed_artist(artist_array)

  artist_array.each do |artist|
    Artist.create(name: artist)
    puts "Creating #{artist}"
  end

end




def seed_song(songs)

  songs.each do |song|
    Song.create(title: song["title"], artist_id: song["artist_id"], level_id: song["level_id"], style_id: song["style_id"], link_ytb: song["url"], lyrics: song["lyrics"] )
    puts "Creating #{song["title"]}"
  end

end


Level.delete_all
Style.delete_all
Artist.delete_all
Song.delete_all


level_seed = ["Débutant", "Intermédiaire", "Expert"]

style_seed = ["Rap", "Variet'", "Jazz", "Reggae", "Pop/Rock"]

artist_seed = ["Christophe Maé", "Iam", "Noir Désir"]


ref_song = [{ "title" => 'Tomber sous le charme', "artist_id" => 1, "level_id" => 1, "style_id" => 2, "url" => 'https://www.youtube.com/watch?v=yRGiYUEFFww', "lyrics" => 'Paroles blablabla' },
          { "title" => 'Petit frère', "artist_id" => 2, "level_id" => 3, "style_id" => 1, "url" => 'https://www.youtube.com/watch?v=INuD2D7R8bk', "lyrics" => 'blablabla' },
          { "title" => "L'homme pressé", "artist_id" => 3, "level_id" => 2, "style_id" => 5, "url" => 'https://www.youtube.com/watch?v=by1RRP9wa_Y', "lyrics" => 'teste noir désir'},
          ]

seed_level(level_seed)
seed_style(style_seed)
seed_artist(artist_seed)
seed_song(ref_song)
