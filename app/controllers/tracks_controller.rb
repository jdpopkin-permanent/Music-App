class TracksController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    @tracks = @album.tracks
    render :index
  end

  def show
    @track = Track.find(params[:id])
    @album = @track.album
    @band = @track.band
    render :show
  end

  def new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(params[:track])
    @track.regular_or_bonus ||= "bonus"

    if @track.save
      # flash message?
      redirect_to bands_url
    else
      # flash message?
      redirect_to :back
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    track = Track.find(params[:id])
    track.update_attributes(params[:track])

    if track.save
      redirect_to bands_url
    else
      redirect_to :back
    end
  end

  def destroy
    track = Track.find(params[:id])

    track.destroy
    redirect_to bands_url
  end
end
