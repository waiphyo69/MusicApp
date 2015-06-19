class AlbumsController < ApplicationController

	  def index
	    @band = Band.find(params[:band_id])
	    @albums = @band.albums
	  end

	  def show
	    @album = Album.find(params[:id])
      @band = Band.find_by_id(@album.band_id)
	  end

	  def new
	    @album = Album.new
      @album.band_id = params[:band_id]
	    @bands = Band.all
	  end

	  def create
	    @album = Album.new(album_params)
	    if @album.save
	      redirect_to album_url(@album)
	    else
	      @bands = Band.all
	      flash.now[:errors] = @album.errors.full_messages
	      render :new
	    end
	  end

	  def edit
	    @album = Album.find(params[:id])
	    @bands = Band.all
	  end

	  def update
	    @album = Album.find(params[:id])
	    if @album.update_attributes(params[:album])
	      redirect_to album_url(@album)
	    else
	      @bands = Band.all
	      flash.now[:errors] = @album.errors.full_messages
	      render :edit
	    end
	  end

	  def destroy
			@band = Band.find(params[:band_id])
	    @album = Album.find(params[:id])
	    @album.destroy
	    redirect_to band_albums_url(@album.band_id)
	  end

	private
		def album_params
			params.require(:album).permit(:title,:band_id,:recording_id)
		end
end
