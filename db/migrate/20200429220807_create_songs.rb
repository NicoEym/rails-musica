class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.boolean :classic
      t.text :lyrics
      t.string :link_ytb
      t.references :artist, foreign_key: true
      t.references :style, foreign_key: true
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
