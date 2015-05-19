class PlaylistsController < ApplicationController
  authorize_resource
  
  def index
    @playlists = Playlist.all
  end

  def add    
    @playlist_record = PlaylistRecord.create(playlist_record_params)
    render json: @playlist_record    
  end

  def show    
    @playlist = Playlist.find(params[:id])
    @records = Playlist.get_records_in_playlist(@playlist)
  end

  def new    
    @playlist = Playlist.new
  end


  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    @playlist.save

    redirect_to edit_playlist_path(@playlist)
  end

  def edit    
    @playlist = Playlist.find(params[:id])
    @records = Playlist.get_records_in_playlist(@playlist)
  end

  def update    
  end

  def destroy    
    @playlist = Playlist.find(params[:id])
    Playlist.destory_playlist_and_entries(@playlist)

    redirect_to playlists_path
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :genre)
  end

  def playlist_record_params
    params.require(:playlist_record).permit(:playlist_id, :record_id)
  end  

end
