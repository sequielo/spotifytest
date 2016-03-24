class SpotifyArtistsController < ApplicationController
  # GET /spotify_artists
  # GET /spotify_artists.xml
  def index
    @spotify_artists = SpotifyArtist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spotify_artists }
    end
  end

  # GET /spotify_artists/1
  # GET /spotify_artists/1.xml
  def show
    @spotify_artist = SpotifyArtist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spotify_artist }
    end
  end

  # GET /spotify_artists/new
  # GET /spotify_artists/new.xml
  def new
    @spotify_artist = SpotifyArtist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spotify_artist }
    end
  end

  # GET /spotify_artists/1/edit
  def edit
    @spotify_artist = SpotifyArtist.find(params[:id])
  end

  # POST /spotify_artists
  # POST /spotify_artists.xml
  def create
    @spotify_artist = SpotifyArtist.new(params[:spotify_artist])

    respond_to do |format|
      if @spotify_artist.save
        format.html { redirect_to(@spotify_artist, :notice => 'SpotifyArtist was successfully created.') }
        format.xml  { render :xml => @spotify_artist, :status => :created, :location => @spotify_artist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spotify_artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spotify_artists/1
  # PUT /spotify_artists/1.xml
  def update
    @spotify_artist = SpotifyArtist.find(params[:id])

    respond_to do |format|
      if @spotify_artist.update_attributes(params[:spotify_artist])
        format.html { redirect_to(@spotify_artist, :notice => 'SpotifyArtist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spotify_artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spotify_artists/1
  # DELETE /spotify_artists/1.xml
  def destroy
    @spotify_artist = SpotifyArtist.find(params[:id])
    @spotify_artist.destroy

    respond_to do |format|
      format.html { redirect_to(spotify_artists_url) }
      format.xml  { head :ok }
    end
  end
end
