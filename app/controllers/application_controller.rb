class ApplicationController < ActionController::Base

  def index
    render :json => ENV
  end
end
