module SpotifyTracksHelper

  def format_duration(time_ms)
    seconds = time_ms/1000 % 60
    minutes = (time_ms/1000 / 60) % 60

    format("%02d:%02d", minutes, seconds)
  end
end
