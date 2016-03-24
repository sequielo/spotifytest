class SpotifyArtist < ActiveRecord::Base
  has_many :spotify_tracks
end
