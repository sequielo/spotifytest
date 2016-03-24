SPOTIFY_CLIENT_ID = '8ab66d9b69f74e76adf7f316dc97e073'
SPOTIFY_CLIENT_SECRET = '47643978a0454bff9341415c5a86848a'


namespace :spotify do
  desc "Search Spotify artists"
  task :artist => :environment do
    unless ENV['search']
      puts "usage: rake spotify:artist search=<name> [save=y]"
    else
      artist_name = ENV['search']
      puts ". searching #{artist_name}..."
      puts ". complete dump:"
      require 'rspotify'
      RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
      query = RSpotify::Artist.search(artist_name)
      puts query.first.to_yaml

      if ENV['save']=='y'
        artist = query.first
        SpotifyArtist.find_or_initialize_by_name(artist.name).update_attributes({
          :popularity => artist.popularity,
          :avatar_url => artist.images.last['url'],
          :genres => artist.genres.join(','),
          :spotify_id => artist.id,
        })
        puts ". saved!"
      end
    end
  end

  desc "Populate Spotify artists from Dj"
  task :populate_djs => :environment do
    Dj.all.each do |dj|
      dj_name = dj.name
      require 'rspotify'
      RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
      query = RSpotify::Artist.search(dj_name)
      
      artist = query.first
      if artist
        SpotifyArtist.find_or_initialize_by_name(artist.name).update_attributes({
          :popularity => artist.popularity,
          :avatar_url => artist.images.last['url'],
          :genres => artist.genres.join(','),
          :spotify_id => artist.id,
        })
        print "."
      else
        puts "dj #{dj_name} not found"
      end
    end
    puts "Done!"
  end

  desc "Populate first track of first album from all DJs"
  task :populate_first_tracks => :environment do
    SpotifyArtist.all.each do |dj|
      require 'rspotify'
      RSpotify.authenticate(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
      artist = RSpotify::Artist.find(dj.spotify_id)
      
      first_album = artist.albums.first
      first_track = first_album.tracks.first
      SpotifyTrack.find_or_initialize_by_spotify_id(first_track.id).update_attributes({
        :name => first_track.name,
        :duration => first_track.duration_ms,
        :album => first_album.name,
        :track_number => first_track.track_number,
        :disc_number => first_track.disc_number,
        :preview_url => first_track.preview_url,
        :spotify_id => first_track.id,
        :spotify_artist_id => dj.id,
      })
      print "."
    end
    puts "Done!"
  end
  
end
