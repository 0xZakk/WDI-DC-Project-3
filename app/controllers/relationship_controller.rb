class PlaylistRecordController < ApplicationController
  def create
    @playlist_record = PlaylistRecord.create(playlist_record_params)
    render json: @playlist_record
  end

  private
  def playlist_record_params
    params.require(:playlist_record).permit(:playlist_id, :album_id)
    
  end
end
