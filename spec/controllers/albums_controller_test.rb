require 'spec_helper'
require 'shared/rest_controller'

describe AlbumsController do
  include Devise::TestHelpers
  context "CRUD actions" do
    before(:each) do
      user = create(:super_user)
      sign_in(user)
      artist = create(:artist)
      @params = {:format => :json, :artist_id => artist.id }
      @subject = create(:album, :artist => artist)
      @built_subject = build(:album, :artist => artist)
      @invalid_subject = build(:invalid_album, :artist => artist)
      @index = Album.all
      @attributes = @subject.attributes
      @attributes["name"] = nil
    end
    it_behaves_like "REST controller"
  end
end
