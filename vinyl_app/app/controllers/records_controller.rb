class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    render json: @card
  end

  private
  def record_params
    params.require(:record).permit(:album_name, :artist_name, :artist_id, :release_year, :image_large, :image_medium, :image_small)
  end
end
