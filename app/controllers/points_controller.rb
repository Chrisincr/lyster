class PointsController < ApplicationController
  before_action :set_point, only: [:show, :edit, :update, :destroy]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /points
  # GET /points.json
  def index
    @points = Point.all
  end

  # GET /points/1
  # GET /points/1.json
  def show
  end

  # GET /points/new
  def new
    @match = Match.find(params[:match_id])
    @point = Point.new(match_id:@match.id)
    tourney = Tournament.find(@match.round.tournament.id)
    @combatants = tourney.combatants.all.collect{|u| [u.user.name, u.id]}
    
  end

  # GET /points/1/edit
  def edit
    tourney = @match.round.tournament
    @combatants = tourney.combatants.all.collect{|u| [u.user.name, u.id]}
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(point_params)
    @match = @point.match
    respond_to do |format|
      if @point.save
        format.html { redirect_to match_path(id:@match.id), action: 'show', notice: 'Point was successfully created.' }
        format.json { render :show, status: :created, location: @point }
      else
        
        format.html { render :new }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1
  # PATCH/PUT /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to match_path(id:@match.id), action: 'show', notice: 'Point was successfully updated.' }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    
    @point.destroy
    respond_to do |format|
      format.html { redirect_to match_path(id:@match.id), action: 'show', notice: 'Point was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end
    def set_match
      @match = @point.match
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
      params.require(:point).permit(:contender_id, :challenger_id, :contender_score, :challenger_score,:match_id)
    end
end
