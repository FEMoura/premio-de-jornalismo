class Sindjornal::JournalistsController < ApplicationController
  before_action :set_journalist, only: [:show, :edit, :update, :destroy]

  layout "layouts/sindjornal"

  # GET /journalists
  def index
    @journalists = Journalist.all
  end

  # GET /journalists/1
  def show
  end

  # GET /journalists/new
  def new
    @journalist = Journalist.new
  end

  # GET /journalists/1/edit
  def edit
  end

  # POST /journalists
  def create
    @journalist = Journalist.new(journalist_params)

    if @journalist.save
      redirect_to @journalist, notice: 'Journalist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /journalists/1
  def update
    if @journalist.update(journalist_params)
      redirect_to @journalist, notice: 'Journalist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /journalists/1
  def destroy
    @journalist.destroy
    redirect_to journalists_url, notice: 'Journalist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journalist
      @journalist = Journalist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def journalist_params
      params.require(:journalist).permit(:name, :cpf)
    end
end
