class TracksController < ApplicationController

  before_action :require_logged_in, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def new 
    @album = Album.find(params[:album_id])
    render :new
  end

  def create 
    @track = Track.new(track_params)
    @track.album_id = params[:track][:album_id]

    if @track.save
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit 
    @track = Track.find(params[:id])
    render :edit
  end

  def show 
    @track = Track.find(params[:id])  
    render :show
  end

  def update 
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy 
    @track = Track.find(params[:id])
    @track.destroy 
    redirect_to album_url(@track.album)
  end

  private 
  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :regular?)
  end
end