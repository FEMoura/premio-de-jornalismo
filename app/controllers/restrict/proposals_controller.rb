class Restrict::ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /proposals
  def index
    @proposals = Proposal.where(user_id: current_user.id).all
    @remaining_submissions = Proposal.remaining_submissions(current_user)
    @still_remaining_submissions = Proposal.remaining_submissions?(current_user)
  end

  # GET /proposals/1
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
    @there_is_work_in_the_special_category =  Proposal.there_is_work_in_the_special_category?(current_user)
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  def create
    new_params = proposal_params
    new_params[:user_id]=current_user.id
    if Proposal.user_student?(current_user)
      new_params[:category] = "Estudante"
    end
    @proposal = Proposal.new(new_params)
    if @proposal.save
      redirect_to restrict_proposal_path(@proposal), notice: 'Proposta enviada com sucesso.'
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
    redirect_to restrict_proposals_url, notice: 'Proposta excluída com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_params
      params.require(:proposal).permit(:category, :user_id, :title, :vehicle, :publication_date, :name_member_1, :cpf_member_1, :name_member_2, :cpf_member_2, :name_member_3, :cpf_member_3, :name_member_4, :cpf_member_4, :name_member_5, :cpf_member_5, :url, :archive)
    end
end
