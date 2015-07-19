class AccountsController < ApplicationController
  include ApplicationHelper

  before_action :set_account, only: [:show, :edit, :update, :destroy, :new_record, :edit_record]
  before_action :calculate_spending_limit, only: [:show, :new_record]
  before_action :load_incomes_outcomes, only: [:new, :create]
  before_action :set_record, only: [:edit_record]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @days_filled = days_filled
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    if @account.save
      if params["account"]["income"]
        @incomes.each do |income|
          if params["account"]["income"]["#{income.id}"]
            account_income = @account.account_incomes.new(name: income.name, value: income.value)
            account_income.save
          end
        end
      end
      if params["account"]["outcome"]
        @outcomes.each do |outcome|
          if params["account"]["outcome"]["#{outcome.id}"]
            account_outcome = @account.account_outcomes.new(name: outcome.name, value: outcome.value)
            account_outcome.save
          end
        end
      end
      start_balance = params['account']['start_balance']
      if not start_balance
        start_balance = 0
      else 
        start_balance = start_balance.to_i
      end
      if start_balance > 0
        account_income = @account.account_incomes.new(name: 'Начальные средства', value: start_balance)
        account_income.save
      elsif start_balance < 0
        account_outcome = @account.account_outcomes.new(name: 'Начальные средства', value: -start_balance)
        account_outcome.save
      end

      update_money(@account)
      @account.save

      redirect_to @account
    else
      render :new
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    redirect_to root_path
  end

  def new_record
    if days_filled < days(@account.month)
      record = @account.records.new(record_params)
      record.limit = @spending_limit
      record.day = days_filled + 1
      record.save
    end

    update_money(@account)
    @account.save

    redirect_to @account
  end

  def edit_record
    @record.update(record_params);

    update_money(@account)
    @account.save

    redirect_to @account
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def set_record
      @record = @account.records.find_by(day: params[:day])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:month, :year)
    end

    def record_params
      params.permit(:value, :desc)
    end

    def load_incomes_outcomes
      @incomes = Income.all
      @outcomes = Outcome.all
    end

    def update_money(account)
      money = 0
      account.account_incomes.each do |income|
        money += income.value
      end
      account.account_outcomes.each do |outcome|
        money -= outcome.value
      end
      account.records.each do |record| 
        money += record.value
      end
      account.money = money
    end

    def calculate_spending_limit
      @spending_limit = 0
      return if days_filled == days(@account.month)

      @spending_limit = @account.money / (days(@account.month) - days_filled)
    end

    def days_filled
      return (@account.records.collect{|r| r.day.to_i }.max || 0)
    end
end
