class BandsController < ApplicationController

  before_action :require_logged_in, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index 
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create 
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params) 
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to edit_band_url
    end
  end

  private 
  def band_params
    params.require(:band).permit(:name)
  end
end