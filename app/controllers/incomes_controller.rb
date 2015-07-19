class IncomesController < ApplicationController
  before_action :set_income, only: [:update, :destroy]

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)
    @income.save
    redirect_to settings_path
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    @income.update(income_params)
    redirect_to settings_path
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    redirect_to settings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:name, :value)
    end
end
