class CreateSpotifyTracks < ActiveRecord::Migration
  def self.up
    create_table :spotify_tracks do |t|
      t.string :name
      t.integer :duration
      t.integer :track_number
      t.integer :disc_number
      t.string :preview_url

      t.timestamps
    end
  end

  def self.down
    drop_table :spotify_tracks
  end
end
