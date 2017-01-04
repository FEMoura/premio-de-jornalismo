class PublicController < ApplicationController
  def index
    @newsletter = Newsletter.new
    if params[:contact]
      @contact = params[:contact]
    end
  end
end
