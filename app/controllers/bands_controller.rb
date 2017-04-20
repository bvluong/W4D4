class BandsController < ApplicationController
  before_action :require_logged_in

  def index
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
      flash[:errors] = @band.errors.full_messages
      redirect_to new_bands_url
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    if @band
      render :edit
    else
      flash[:errors] = "Band does not exist"
      redirect_to bands_url
    end
  end

  def update

  end

  def destroy

  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
