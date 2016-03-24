class AddSpotifyArtistIdToSpotifyTracks < ActiveRecord::Migration
  def self.up
    add_column :spotify_tracks, :spotify_artist_id, :integer
  end

  def self.down
    remove_column :spotify_tracks, :spotify_artist_id
  end
end
