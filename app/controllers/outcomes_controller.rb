class OutcomesController < ApplicationController
  before_action :set_outcome, only: [:update, :destroy]

  # POST /outcomes
  # POST /outcomes.json
  def create
    @outcome = Outcome.new(outcome_params)
    @outcome.save
    redirect_to settings_path
  end

  # PATCH/PUT /outcomes/1
  # PATCH/PUT /outcomes/1.json
  def update
    @outcome.update(outcome_params)
    redirect_to settings_path
  end

  # DELETE /outcomes/1
  # DELETE /outcomes/1.json
  def destroy
    @outcome.destroy
    redirect_to settings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcome
      @outcome = Outcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcome_params
      params.require(:outcome).permit(:name, :value)
    end
end
