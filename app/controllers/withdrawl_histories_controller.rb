class WithdrawlHistoriesController < ApplicationController
  before_action :set_withdrawl_history, only: %i[ show edit update destroy ]

  # GET /withdrawl_histories or /withdrawl_histories.json
  def index
    @withdrawl_histories = WithdrawlHistory.all
  end

  # GET /withdrawl_histories/1 or /withdrawl_histories/1.json
  def show
  end

  # GET /withdrawl_histories/new
  def new
    @withdrawl_history = WithdrawlHistory.new
  end

  # GET /withdrawl_histories/1/edit
  def edit
  end

  # POST /withdrawl_histories or /withdrawl_histories.json
  def create
    @withdrawl_history = WithdrawlHistory.new(withdrawl_history_params)

    respond_to do |format|
      if @withdrawl_history.save
        format.html { redirect_to withdrawl_history_url(@withdrawl_history), notice: "Withdrawl history was successfully created." }
        format.json { render :show, status: :created, location: @withdrawl_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @withdrawl_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdrawl_histories/1 or /withdrawl_histories/1.json
  def update
    respond_to do |format|
      if @withdrawl_history.update(withdrawl_history_params)
        format.html { redirect_to withdrawl_history_url(@withdrawl_history), notice: "Withdrawl history was successfully updated." }
        format.json { render :show, status: :ok, location: @withdrawl_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @withdrawl_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdrawl_histories/1 or /withdrawl_histories/1.json
  def destroy
    @withdrawl_history.destroy

    respond_to do |format|
      format.html { redirect_to withdrawl_histories_url, notice: "Withdrawl history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdrawl_history
      @withdrawl_history = WithdrawlHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def withdrawl_history_params
      params.require(:withdrawl_history).permit(:w_coins, :Trans_type_logo, :Transaction_ID, :transaction_type)
    end
end
