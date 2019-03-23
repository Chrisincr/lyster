class TournemantsController < ApplicationController
  before_action :set_tournemant, only: [:show, :edit, :update, :destroy]

  # GET /tournemants
  # GET /tournemants.json
  def index
    @tournemants = Tournemant.all
  end

  # GET /tournemants/1
  # GET /tournemants/1.json
  def show
    @rounds = @tournemant.rounds.all
    @combatants = @tournemant.combatants.all
  end

  # GET /tournemants/new
  def new
    @tournemant = Tournemant.new
  end

  # GET /tournemants/1/edit
  def edit
  end

  # POST /tournemants
  # POST /tournemants.json
  def create
    @tournemant = Tournemant.new(tournemant_params)

    respond_to do |format|
      if @tournemant.save
        format.html { redirect_to @tournemant, notice: 'Tournemant was successfully created.' }
        format.json { render :show, status: :created, location: @tournemant }
      else
        format.html { render :new }
        format.json { render json: @tournemant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournemants/1
  # PATCH/PUT /tournemants/1.json
  def update
    respond_to do |format|
      if @tournemant.update(tournemant_params)
        format.html { redirect_to @tournemant, notice: 'Tournemant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournemant }
      else
        format.html { render :edit }
        format.json { render json: @tournemant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournemants/1
  # DELETE /tournemants/1.json
  def destroy
    @tournemant.destroy
    respond_to do |format|
      format.html { redirect_to tournemants_url, notice: 'Tournemant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournemant
      @tournemant = Tournemant.find(params[:tid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournemant_params
      params.require(:tournemant).permit(:name, :user_id, :description, :start_date)
    end
end
