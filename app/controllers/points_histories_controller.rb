class PointsHistoriesController < ApplicationController
  before_action :set_points_history, only: %i[ show edit update destroy ]

  # GET /points_histories or /points_histories.json
  def index
    @points_histories = PointsHistory.all
  end

  # GET /points_histories/1 or /points_histories/1.json
  def show
  end

  # GET /points_histories/new
  def new
    @points_history = PointsHistory.new
  end

  # GET /points_histories/1/edit
  def edit
  end

  # POST /points_histories or /points_histories.json
  def create
    @points_history = PointsHistory.new(points_history_params)

    respond_to do |format|
      if @points_history.save
        format.html { redirect_to points_history_url(@points_history), notice: "Points history was successfully created." }
        format.json { render :show, status: :created, location: @points_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @points_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points_histories/1 or /points_histories/1.json
  def update
    respond_to do |format|
      if @points_history.update(points_history_params)
        format.html { redirect_to points_history_url(@points_history), notice: "Points history was successfully updated." }
        format.json { render :show, status: :ok, location: @points_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @points_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_histories/1 or /points_histories/1.json
  def destroy
    @points_history.destroy

    respond_to do |format|
      format.html { redirect_to points_histories_url, notice: "Points history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_points_history
      @points_history = PointsHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def points_history_params
      params.require(:points_history).permit(:A_coins, :Add_type_logo, :Scheme_Name)
    end
end
