require 'spec_helper'
require 'shared/rest_controller'

describe SongsController do
  include Devise::TestHelpers
  context "CRUD actions" do
    before(:each) do
      user = create(:super_user)
      sign_in(user)
      album = create(:album)
      @params = {:format => :json, :artist_id => album.artist.id ,:album_id => album.id}
      @subject = create(:song, :album => album)
      @built_subject = build(:song, :album => album)
      @invalid_subject = build(:invalid_song, :album => album)
      @index = Song.all
      @attributes = @subject.attributes
      @attributes["title"] = nil
      
      @object_title_method= "title"
    end
    it_behaves_like "REST controller"
  end
end
