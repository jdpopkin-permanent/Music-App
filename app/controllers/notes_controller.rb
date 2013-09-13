class NotesController < ApplicationController
  def new
    @track = params[:track_id]
    render :new
  end

  def create
    note = Note.new(params[:note])
    track = Track.includes(:album, :band).find(params[:track_id])
    if note.save
      redirect_to band_album_track_url(track.band.id, track.album.id, track.id)
    else
      # fail
      redirect_to :back
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def destroy
    note = Note.find(params[:id])
    track = note.track
    note.destroy
    redirect_to band_album_track_url(track.band.id, track.album.id, track.id)
  end
end
