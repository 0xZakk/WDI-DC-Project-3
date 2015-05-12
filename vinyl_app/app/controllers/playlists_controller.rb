class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def add
    
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end


  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :genre)
  end

end
