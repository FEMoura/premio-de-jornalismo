class Restrict::ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  # GET /proposals
  def index
    @proposals = Proposal.all
  end

  # GET /proposals/1
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  def create
    new_params = proposal_params
    new_params[:user_id]=current_user.id
    @proposal = Proposal.new(new_params)
    if @proposal.save
      redirect_to restrict_proposal_path(@proposal), notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /proposals/1
  def update
    if @proposal.update(proposal_params)
      redirect_to restrict_proposal_path(@proposal), notice: 'Proposal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /proposals/1
  def destroy
    @proposal.destroy
    redirect_to restrict_proposals_url, notice: 'Proposal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_params
      params.require(:proposal).permit(:category, :user_id, :title, :vehicle, :publication_date, :name_member_1, :cpf_member_1, :name_member_2, :cpf_member_2, :name_member_3, :cpf_member_3, :name_member_4, :cpf_member_4, :name_member_5, :cpf_member_5, :url)
    end
end
