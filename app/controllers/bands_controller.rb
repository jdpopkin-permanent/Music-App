class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    # can do: @band.includes(:albums).includes(:tracks)
    @band = Band.includes(:albums, :tracks).find(params[:id]) # nest this.
    @albums = @band.albums
    @tracks = @band.tracks
  end

  def new
    render :new
  end

  def create
    band = Band.new(params[:band])

    if band.save
      # add success message to flash?
      redirect_to bands_url
    else
      # add error to flash?
      redirect_to :back
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    band = Band.find(params[:id])
    band.update_attributes(params[:band])

    if band.save
      redirect_to bands_url
    else
      redirect_to :back
    end
  end

  def destroy
    band = Band.find(params[:id])

    band.destroy
    redirect_to bands_url
  end
end
