class PagesController < ApplicationController
  def settings
  	@incomes = Income.all
  	@income = Income.new
  	@outcomes = Outcome.all
  	@outcome = Outcome.new
  end
end
