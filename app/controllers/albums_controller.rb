class AlbumsController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @albums = @band.albums

    render :index
  end

  def show
    @album = Album.find(params[:id])
    @band = @album.band
    @tracks = @album.tracks
    render :show
  end

  def new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(params[:album])
    @album.live_or_studio ||= "studio"

    if @album.save
      # flash message?
      redirect_to bands_url
    else
      # flash message?
      redirect_to :back
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    album = Album.find(params[:id])
    album.update_attributes(params[:album])

    if album.save
      redirect_to bands_url
    else
      redirect_to :back
    end
  end

  def destroy
    album = Album.find(params[:id])

    album.destroy
    redirect_to bands_url
  end
end
