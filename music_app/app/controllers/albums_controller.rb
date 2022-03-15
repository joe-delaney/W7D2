class AlbumsController < ApplicationController

  def new 
    @band = Band.find(params[:band_id])
    render :new
  end

  def create 
    @album = Album.new(album_params)
    @album.band_id = params[:album][:band_id]

    if @album.save 
      redirect_to band_url(params[:album][:band_id])
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit 
    @album = Album.find(params[:id])
    render :edit
  end

  def update 
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy 
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band)
  end

  def show 
    @album = Album.find(params[:id])
    render :show
  end

  private 

  def album_params
    params.require(:album).permit(:title, :year, :live?)
  end
end

