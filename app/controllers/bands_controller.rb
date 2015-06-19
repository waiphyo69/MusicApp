class BandsController < ApplicationController

  def index
    @bands = Band.all 
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(band_params)
  end

  def update
    @band = Band.find(band_params)
    if @band.update_attributes(params[:band])
      redirect_to @band
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
