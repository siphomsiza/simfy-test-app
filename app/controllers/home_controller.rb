class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout 'landing_page'
  def index
    @albums = Album.all.order("release_date desc")
    @albums = @albums.paginate page: params[:page], per_page: params[:per_page]||6
    @featured_albums = Album.all.order("created_at desc").limit(10)
  end

  def view_artist_albums
    @artist = Artist.find(params[:id])
    @albums = @artist.albums.order("release_date desc")
    @albums = @albums.paginate page: params[:page], per_page: params[:per_page]||6
  end

  def view_album_songs
    @album = Album.find(params[:id])
    @songs = @album.songs.order("title asc")
  end

end
