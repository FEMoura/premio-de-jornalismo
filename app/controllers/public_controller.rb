class PublicController < ApplicationController
  def index
    if params[:contact]
      @contact = params[:contact]
    end
  end
end
