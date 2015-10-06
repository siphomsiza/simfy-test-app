class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to :controller => :all_songs}
    end
  end
end
