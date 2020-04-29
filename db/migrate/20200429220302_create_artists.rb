class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.text :biography
      t.string :picture

      t.timestamps
    end
  end
end
