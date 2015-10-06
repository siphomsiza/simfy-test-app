class AlbumsController < ApplicationController
   load_and_authorize_resource :artist
   load_and_authorize_resource :album, :through => :artist

  # GET /albums
  # GET /albums.json
  def index
    params[:q]||={:s => "name asc"}
    unless current_user.admin.present?
      @albums = current_user.albums
    end
    @q =  @albums.search(params[:q])
    @albums = @q.result.page(params[:page]).limit(params[:per_page]||10)
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    respond_to do |format|
      @album.user = current_user
      if @album.save
        format.html { redirect_to artist_album_path(@artist,@album), notice: 'album was successfully created.' }
        format.json { render action: 'show', status: :created, location: artist_album_path(@artist,@album) }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to artist_album_url(@artist,@album), notice: 'album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /albums/1/delete
  def delete
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    respond_to do |format|
      if @album.destroy
        format.html { redirect_to artist_albums_url, notice: 'album was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render action: 'delete' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def download
    send_file(@album.cover.url, :type => 'image/jpeg', :disposition => 'inline')
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :release_date, :cover, :_destroy)
    end

end
