class AddAlbumToSpotifyTracks < ActiveRecord::Migration
  def self.up
    add_column :spotify_tracks, :album, :string
    add_column :spotify_tracks, :spotify_id, :string
  end

  def self.down
    remove_column :spotify_tracks, :album
    remove_column :spotify_tracks, :spotify_id
  end
end
