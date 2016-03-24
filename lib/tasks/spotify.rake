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
        SpotifyArtist.create({
          :name => artist.name,
          :popularity => artist.popularity,
          :avatar_url => artist.images.last['url'],
          :genres => artist.genres.join(','),
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
        SpotifyArtist.create({
          :name => artist.name,
          :popularity => artist.popularity,
          :avatar_url => artist.images.last['url'],
          :genres => artist.genres.join(','),
        })
        print "."
      else
        puts "dj #{dj_name} not found"
      end
    end
    puts "Done!"
  end

  
end
