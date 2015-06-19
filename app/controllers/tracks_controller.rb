class TracksController < ApplicationController
  # before_filter :logged_in?, :activated?
  # before_filter :admin?, :except => [:index, :show]

  def index
    @album = Album.find(params[:album_id])
    @tracks = @album.tracks
  end

  def show
    @track = Track.find(params[:id])
    @album = Album.find_by(@track.album_id)
  end

  def new
    @track = Track.new(album_id: params[:album_id])
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    if @track.save
			@album = Album.find_by(@track.album_id)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      # redirect_to
			@album = Album.find_by(@track.album_id)
			redirect_to album_url(@album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_tracks_url(@track.album_id)
  end

	private

	def track_params
		params.require(:track).permit(:album_id,:track_type,:lyrics)
	end
end
