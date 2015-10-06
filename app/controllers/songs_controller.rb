class SongsController < ApplicationController
  load_and_authorize_resource :artist
  load_and_authorize_resource :album , :through => :artist
  load_and_authorize_resource :song, :through => :album

  def index
    params[:q]||={:s => "name asc"}
    unless current_user.admin.present?
      @songs = current_user.songs
    end
    @q =  @songs.search(params[:q])
    @songs = @q.result.page(params[:page]).limit(params[:per_page]||10)
  end

  # GET /song/1
  # GET /song/1.json
  def show
  end

  # GET /song/new
  def new
  end

  # GET /song/1/edit
  def edit
  end

  # POST /song
  # POST /song.json
  def create
    respond_to do |format|
      @song.user = current_user
      if @song.save
        format.html { redirect_to artist_album_song_url(@artist,@album,@song), notice: 'song was successfully created.' }
        format.json { render action: 'show', status: :created, location: artist_album_song_url(@artist,@album,@song) }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song/1
  # PATCH/PUT /song/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to artist_album_song_url(@artist,@album,@song), notice: 'song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /song/1/delete
  def delete
  end

  # DELETE /song/1
  # DELETE /song/1.json
  def destroy
    respond_to do |format|
      if @song.destroy
        format.html { redirect_to artist_album_songs_url, notice: 'album was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render action: 'delete' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :album_id, :duration).merge!(:album_id => params[:album_id])
    end
end
