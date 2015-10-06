require 'spec_helper'
require 'shared/rest_controller'

describe ArtistsController do
  include Devise::TestHelpers
  context "CRUD actions" do
    before(:each) do
      user = create(:super_user)
      sign_in(user)
      @params = {:format => :json}
      @subject = create(:artist)
      @built_subject = build(:artist)
      @invalid_subject = build(:invalid_artist)
      @index = Artist.all
      @attributes = @subject.attributes
      @attributes["name"] = nil
    end
    it_behaves_like "REST controller"
  end
end
