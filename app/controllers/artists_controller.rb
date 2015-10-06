class ArtistsController < ApplicationController
  load_and_authorize_resource :artist

  # GET /artists
  # GET /artists.json
  def index
    params[:q]||={:s => "name asc"}
    unless current_user.admin.present?
      @artists = current_user.artists
    end
    @q =  @artists.search(params[:q])
    @artists = @q.result.page(params[:page]).limit(params[:per_page]||10)
  end

  def view_all_songs

  end

  # GET /artists/1
  # GET /artists/1.json
  def show
  end

  # GET /artists/new
  def new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    respond_to do |format|
      @artist.user = current_user
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /artists/1/delete
  def delete
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    respond_to do |format|
      if @artist.destroy
        format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render action: 'delete' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :_destroy)
    end
end
