class CreateSpotifyArtists < ActiveRecord::Migration
  def self.up
    create_table :spotify_artists do |t|
      t.string :name
      t.integer :popularity
      t.string :avatar_url
      t.string :genres

      t.timestamps
    end
  end

  def self.down
    drop_table :spotify_artists
  end
end
