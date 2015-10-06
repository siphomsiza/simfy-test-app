class AllSongsController < ApplicationController
  def index
    params[:q]||={:s => "name asc"}
    @songs = Song.all
    @q =  @songs.search(params[:q])
    @songs = @q.result.page(params[:page])

    @artists = Artist.all
    @q =  @artists.search(params[:q])
    @artists = @q.result.page(params[:page])#.limit(params[:per_page]||10)
    
    @albums = Album.all
    @q =  @albums.search(params[:q])
    @albums = @q.result.page(params[:page])#.limit(params[:per_page]||10)

  end

  def show
  end

  def downlod
  end
end
