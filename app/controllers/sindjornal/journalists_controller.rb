class Sindjornal::JournalistsController < ApplicationController
  before_action :set_journalist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :verify_journalist
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  require "cpf_cnpj"

  layout "layouts/sindjornal"

  # GET /journalists
  def index
    journalists_scope = Journalist.all if params[:filter].to_s.empty?
    unless params[:filter].to_s.empty?
      attribute = "%#{params[:filter].downcase}%"
      journalists_scope = Journalist.where('lower(name) LIKE ? OR lower(cpf) LIKE ?', attribute, attribute)
    end

    @journalists = smart_listing_create :journalists, journalists_scope, partial: 'sindjornal/journalists/list',
                                       default_sort: {name: 'asc'}
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
      redirect_to @journalist, notice: 'Jornalista criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /journalists/1
  def update
    if @journalist.update(journalist_params)
      redirect_to sindjornal_journalists_path, notice: 'Jornalista atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /journalists/1
  def destroy
    @journalist.destroy
    redirect_to sindjornal_journalists_path, notice: 'Jornalista excluido com sucesso.'
  end

  def verify_journalist
    params[:cpf] = cpf = CPF.new(params[:cpf]).formatted
    journalist = Journalist.find_by_cpf(params[:cpf])
    if journalist.nil?
      render json: {msg: 'Não listado'}, status: 401
    else
      render json: {msg: 'Autorizado'}
    end
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
