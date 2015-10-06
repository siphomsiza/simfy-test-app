require 'spec_helper'

describe HomeController do
  context "GET 'index'" do
    it "returns http success" do
      # get 'index'
      # expect(response).to be_success
      get :index
      expect(response.status).to eq(200)
    end
  end
end
