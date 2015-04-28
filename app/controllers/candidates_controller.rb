class CandidatesController < ApplicationController
  before_action :set_candidate, except: [:index, :new]

  # GET /candidates
  def index
    @candidates = Candidate.all.page params[:page]
  end

  # GET /candidates/1
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
        redirect_to @candidate, notice: 'Candidate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /candidates/1
  def update
    if @candidate.update(candidate_params)
      redirect_to @candidate, notice: 'Candidate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate.destroy
    redirect_to candidates_url, notice: 'Candidate was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = params[:id] ? Candidate.find(params[:id]) : Candidate.new(candidate_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:name, :published)
  end
end