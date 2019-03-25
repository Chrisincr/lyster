class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  # GET /rounds
  # GET /rounds.json
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @rounds = Round.where(tournament:@tournament)
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @matches = @round.matches.all
    
  end

  # GET /rounds/new
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.new(tournament:@tournament)
    
  end

  # GET /rounds/1/edit
  def edit
    @tournament = @round.tournament
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    respond_to do |format|
      if @round.save
        format.html { redirect_to tournament_path(id:@round.tournament_id), action: 'show', notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to tournament_path(id:@round.tournament_id), action: 'show', notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to tournament_path(id:@round.tournament_id), action: 'show', notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end
    def set_tournament
      @tournament = @round.tournament
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:number, :tournament_id)
    end
end
