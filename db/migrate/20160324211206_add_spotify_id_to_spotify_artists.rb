class AddSpotifyIdToSpotifyArtists < ActiveRecord::Migration
  def self.up
    add_column :spotify_artists, :spotify_id, :string
  end

  def self.down
    remove_column :spotify_artists, :spotify_id
  end
end
