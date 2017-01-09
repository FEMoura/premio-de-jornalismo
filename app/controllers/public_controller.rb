class PublicController < ApplicationController
  def index
    @newsletter = Newsletter.new
    if params[:contact]
      @contact = params[:contact]
    end
  end

  def training
    if params[:training_id]
      @training = params[:training_id]
    end
  end
end
