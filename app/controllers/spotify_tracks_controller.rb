class SpotifyTracksController < ApplicationController
  # GET /spotify_tracks
  # GET /spotify_tracks.xml
  def index
    @spotify_tracks = SpotifyTrack.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spotify_tracks }
    end
  end

  # GET /spotify_tracks/1
  # GET /spotify_tracks/1.xml
  def show
    @spotify_track = SpotifyTrack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spotify_track }
    end
  end

  # GET /spotify_tracks/new
  # GET /spotify_tracks/new.xml
  def new
    @spotify_track = SpotifyTrack.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spotify_track }
    end
  end

  # GET /spotify_tracks/1/edit
  def edit
    @spotify_track = SpotifyTrack.find(params[:id])
  end

  # POST /spotify_tracks
  # POST /spotify_tracks.xml
  def create
    @spotify_track = SpotifyTrack.new(params[:spotify_track])

    respond_to do |format|
      if @spotify_track.save
        format.html { redirect_to(@spotify_track, :notice => 'SpotifyTrack was successfully created.') }
        format.xml  { render :xml => @spotify_track, :status => :created, :location => @spotify_track }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spotify_track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spotify_tracks/1
  # PUT /spotify_tracks/1.xml
  def update
    @spotify_track = SpotifyTrack.find(params[:id])

    respond_to do |format|
      if @spotify_track.update_attributes(params[:spotify_track])
        format.html { redirect_to(@spotify_track, :notice => 'SpotifyTrack was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spotify_track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spotify_tracks/1
  # DELETE /spotify_tracks/1.xml
  def destroy
    @spotify_track = SpotifyTrack.find(params[:id])
    @spotify_track.destroy

    respond_to do |format|
      format.html { redirect_to(spotify_tracks_url) }
      format.xml  { head :ok }
    end
  end
end
